class Activity < ActiveRecord::Base
  belongs_to :owner, class_name: User
  has_many :comments, dependent: :destroy
  has_one :category, dependent: :destroy

  validates :owner_id, presence: true
  validates :title, presence: true
  validates :end_time, presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  after_create do
    self.category = Category.new
  end

  def number_of_comments
    self.comments.length
  end
end
