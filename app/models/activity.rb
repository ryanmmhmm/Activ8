class Activity < ActiveRecord::Base
  belongs_to :owner, class_name: User
  has_many :comments

  validates :owner_id, presence: true
  validates :title, presence: true
  validates :end_time, presence: true
end
