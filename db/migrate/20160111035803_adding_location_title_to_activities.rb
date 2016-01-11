class AddingLocationTitleToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :location_title, :string
  end
end
