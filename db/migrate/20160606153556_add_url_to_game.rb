class AddUrlToGame < ActiveRecord::Migration
  def change
    add_column :games, :url_comunio, :string
  end
end
