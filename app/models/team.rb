# == Schema Information
#
# Table name: teams
#
#  id                 :integer          not null, primary key
#  name               :integer
#  group_id           :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Team < ActiveRecord::Base
  # !**************************************************
  # !                Associations
  # !**************************************************
  has_many :players

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