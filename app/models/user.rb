class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :owned_activities, class_name: 'Activity', foreign_key: 'owner_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :category, dependent: :destroy

  # Sorcery related
  validates :password, length: { minimum: 5}, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  #Custom validations
  validates :email, uniqueness: true

  after_create do
    self.category = Category.new
  end
end
