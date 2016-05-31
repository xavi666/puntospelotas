# == Schema Information
#
# Table name: players
#
#  name               :integer
#  team_id            :integer
#  position           :string
#  created_at         :datetime
#  updated_at         :datetime
#

class Player < ActiveRecord::Base
  # !**************************************************
  # !                Associations
  # !**************************************************
  belongs_to :team

  # !**************************************************
  # !                Validations
  # !**************************************************

  # !**************************************************
  # !                Callbacks
  # !**************************************************

  # !**************************************************
  # !                  Other
  # !**************************************************
  extend Enumerize
  enumerize :position, in: [:portero, :defensa, :central, :delantero], predicates: true
  
  def test
    puts "---> GILIPOOLLAS"
  end

  def to_s
    name
  end

end