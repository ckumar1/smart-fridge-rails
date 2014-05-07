class Recipe < ActiveRecord::Base

  # Validations
  validates :name, presence: true, length: { maximum: 80 }
  validates :directions, presence: true

  # Relationships
  belongs_to :user
  has_many :ingredients, dependent: :destroy

  # Scopes
  default_scope -> { order('name ASC') }



end
