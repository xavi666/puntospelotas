class CreateGame < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.integer :local_team_id
      t.integer :visitant_team_id
      t.integer :goals_local_team
      t.integer :goals_visitant_team
      t.datetime :game_date
      t.string :stage

      t.timestamps
    end
  end

  def down
    drop_table :games
  end
end
