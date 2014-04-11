class User < ActiveRecord::Base
  include Clearance::User
  before_save { self.email = email.downcase }
  # Validations
  VALID_NAME_REGEX = /\A([a-zA-Z0-9_-]|(\s)?){3,16}\Z/

  #make sure not a food item, as both User and FoodItem have name fields
  #if !FoodItem
  validates :name, presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX }
 # end
 # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
 # validates :email, format: { with: VALID_EMAIL_REGEX }

  validates :password, length: { minimum: 8 }

  # Relationships
  has_many :food_items, dependent: :destroy
  has_many  :recipes, dependent: :destroy
end
