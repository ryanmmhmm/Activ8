class Activity < ActiveRecord::Base
  belongs_to :owner, class_name: User

  validates :title, presence: true
  validates :end_time, presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
