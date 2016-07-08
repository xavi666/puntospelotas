# == Schema Information
#
# Table name: games
#
#  id                   :integer          not null, primary key
#  local_team_id        :integer
#  visitant_team_id     :integer
#  goals_local_team     :integer
#  goals_visitant_team  :integer
#  game_date            :datetime
#  stage                :string
#  created_at           :datetime
#  updated_at           :datetime
#

require 'nokogiri'
require 'open-uri'

class Game < ActiveRecord::Base
  # !**************************************************
  # !                Associations
  # !**************************************************
  belongs_to :local_team, class_name: "Team", foreign_key: 'local_team_id'
  belongs_to :visitant_team, class_name: "Team", foreign_key: 'visitant_team_id'  

  # !**************************************************
  # !                Validations
  # !**************************************************

  # !**************************************************
  # !                Callbacks
  # !**************************************************
  after_create :initial_job
  after_save :notification_delayed_job, :if => :comunio_points_changed?

  # !**************************************************
  # !                  Other
  # !**************************************************

  def notification_delayed_job
    if self.comunio_points
      UserMailer.game_email(User.first, self).deliver
    end
  end

  def initial_job
    UserMailer.game_email(User.first, self).deliver    
    # Verifica al cap de dues hores d'acabar el partit
    #Game.delay(run_at: self.game_date + 1.hours, queue: 'check_points').check_points(self) if self.game_date
    # Verifica al cap d'una hora de crear el Game
    Game.delay(run_at: DateTime.now + 1.minutes, queue: 'check_points').check_points(self) if self.game_date
  end

  def self.check_points game

    UserMailer.game_email(User.first, game).deliver    

    page = Nokogiri::HTML(open(game.comunio_url))
    estadistica = {:local => [], :visitante => [] }

    # MARCADOR
    marcador = page.css('.marcador')
    goles_local = marcador.search('span/text()')[0]
    goles_visitante = marcador.search('span/ text()')[1]

    if goles_local != "-" and goles_visitante != "-"
      
      # LOCAL
      tabla_local = page.css('div.wrapper > div.content > div.group > div.col > div.box > table')[0]
      tabla_local.search('tr').collect do |row|
        posicion = row.css('td.mini/span/text()').to_s
        if ['PT', 'DF', 'MC', 'DL'].include? posicion
          nombre = row.css('td.ancho/a/strong/text()').to_s
          puntos = row.css('td.score/text()').to_s
          estadistica[:local] << {position: posicion, nombre: nombre, puntos: puntos}
        end
      end

      #VISITANTE
      tabla_visitante = page.css('div.wrapper > div.content > div.group > div.col > div.box > table')[2]
      tabla_visitante.search('tr').collect do |row|
        posicion = row.css('td.mini/span/text()').to_s
        if ['PT', 'DF', 'MC', 'DL'].include? posicion
          nombre = row.css('td.ancho/a/strong/text()').to_s
          puntos = row.css('td.score/text()').to_s
          estadistica[:visitante] << {position: posicion, nombre: nombre, puntos: puntos}
        end
      end

      if estadistica[:local].count > 0 and estadistica[:visitante].count > 0
        game.goals_local_team = goles_local.to_s.to_i
        game.goals_visitant_team = goles_visitante.to_s.to_i
        game.comunio_points_value = estadistica
        game.comunio_points = true
        game.save!
      end
    else
      # Verifica cada minut
      Game.delay(run_at: DateTime.now + 20.seconds, queue: 'check_points').check_points(game) if game.game_date
    end
  end

end