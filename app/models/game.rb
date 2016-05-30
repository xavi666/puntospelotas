# == Schema Information
#
# Table name: games
#
#  id                   :integer          not null, primary key
#  local_team_id        :integer
#  visitant_team_id     :integer
#  goals_local_team     :integer
#  goals_visitant_team  :integer
#  game_date            :integer
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

  # !**************************************************
  # !                  Other
  # !**************************************************

end