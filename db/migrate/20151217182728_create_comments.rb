class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :activity_id
      t.string :body

      t.timestamps null: false
    end
  end
end
