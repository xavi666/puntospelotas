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
    Game.delay(run_at: self.game_date + 2.hours, queue: 'check_points').check_points(self) if self.game_date
  end

  def self.check_points game
    puts DateTime.now.to_s+"-------> I AM GOING TO CHECK THE POINTS HERE!!!!"
    Game.delay(run_at: DateTime.now + 2.minutes, queue: 'check_points').check_points(game) if game.game_date
  end

  #    Delayed::Job.where(queue: 'check_points').delete_all
  #    CurrencyConversion.delay(run_at: Date.today.end_of_day + 5.hours, queue: 'currency_updates').update_remote_currencies
end