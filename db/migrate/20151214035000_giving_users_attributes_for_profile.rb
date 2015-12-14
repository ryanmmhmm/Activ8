class GivingUsersAttributesForProfile < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :picture_url, :string
  end
end
