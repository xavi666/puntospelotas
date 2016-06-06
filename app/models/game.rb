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

  # !**************************************************
  # !                  Other
  # !**************************************************


  def initial_job
    Game.delay(run_at: self.game_date + 1.hours, queue: 'check_points').check_points(self) if self.game_date
  end

  def self.check_points game
    #UserMailer.welcome_email(User.first).deliver

    page = Nokogiri::HTML(open(game.url_comunio))
    marcador = page.css('.marcador')
    goles_local = marcador.search('span/text()')[0]
    goles_visitante = marcador.search('span/text()')[1]

    puts "goles_local ==> "+goles_local.to_s
    puts "goles_visitante ==> "+goles_visitante.to_s

    if goles_local != "-" and goles_visitante != "-"
      tabla_local = page.css('div.group/table/tbody') 
      puts tabla_local
    end
    #Game.delay(run_at: DateTime.now + 1.minute, queue: 'check_points').check_points(game) if game.game_date
  end

end