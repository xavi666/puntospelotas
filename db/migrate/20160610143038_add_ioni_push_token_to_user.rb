class AddIoniPushTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :ionic_push_token, :string
  end
end
