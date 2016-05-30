class AddPointsToGame < ActiveRecord::Migration
  def change
    add_column :games, :points, :boolean, default: false  
  end
end
