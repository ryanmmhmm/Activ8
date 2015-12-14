class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.string :location
      t.datetime :end_time
      t.string :picture_url
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
