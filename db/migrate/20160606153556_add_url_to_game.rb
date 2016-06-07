class AddUrlToGame < ActiveRecord::Migration
  def change
    add_column :games, :comunio_url, :string
    add_column :games, :comunio_points, :boolean, default: false
    add_column :games, :comunio_points_value, :json
  end
end
