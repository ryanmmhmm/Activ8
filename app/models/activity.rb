class Activity < ActiveRecord::Base
  validates :title, presence: true
  validates :end_time, presence: true
end
