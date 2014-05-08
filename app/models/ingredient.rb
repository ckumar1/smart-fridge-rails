class Ingredient < ActiveRecord::Base

			

  # Validations
  validates :name, presence: true, length: {maximum: 50}
  validates :quantity, presence: true
  validates :recipe, presence: true

  # Relationships
  belongs_to :recipe

  # Scopes

end
