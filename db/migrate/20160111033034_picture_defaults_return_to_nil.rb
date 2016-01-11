class PictureDefaultsReturnToNil < ActiveRecord::Migration
  def change
    change_column_default(:users, :picture_url, nil )
    change_column_default(:activities, :picture_url, nil)
  end
end
