class Ingredient < ActiveRecord::Base

  # Validations
  validates :name, presence: true, length: {maximum: 50}
  validates :quantity, presence: true

  # Relationships
  belongs_to :recipe

  # Scopes

end
