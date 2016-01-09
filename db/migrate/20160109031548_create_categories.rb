class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :activity_id
      t.integer :user_id
      t.boolean :athletic
      t.boolean :sporting_event
      t.boolean :night_life
      t.boolean :general
      t.boolean :other
      t.boolean :random
      t.boolean :food
      t.boolean :drink
      t.boolean :music
      t.boolean :game
      t.boolean :information
      t.boolean :art
      t.boolean :technology
      t.boolean :deal

      t.timestamps null: false
    end
  end
end
