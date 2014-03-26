class User < ActiveRecord::Base
include Clearance::User

  # Validations
  validates :name, presence: true

  # Relationships
  has_many :food_items, dependent: :destroy
  has_many  :recipes, dependent: :destroy

end
