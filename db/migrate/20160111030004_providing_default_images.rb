class ProvidingDefaultImages < ActiveRecord::Migration
  def change
    change_column_default(:users, :picture_url, from: '', to: '/assets/images/blank-user-pic.png')
    change_column_default(:activities, :picture_url, from: '', to: 'assets/images/event-image.jpeg')
  end
end
