class User < ActiveRecord::Base
  include Clearance::User
  before_save { self.email = email.downcase }
  # Validations
  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 8 }

  # Relationships
  has_many :food_items, dependent: :destroy
  has_many  :recipes, dependent: :destroy
end
