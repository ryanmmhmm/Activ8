class Activity < ActiveRecord::Base
  belongs_to :owner, class_name: User

  validates :title, presence: true
  validates :end_time, presence: true
end
