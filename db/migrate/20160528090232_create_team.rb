class CreateTeam < ActiveRecord::Migration
  def up
    create_table :teams do |t|
      t.string :name
      t.string :group

      t.timestamps
    end
  end

  def down
    drop_table :teams
  end
end
