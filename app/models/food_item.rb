class FoodItem < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order('expiration_date DESC') }
  validates :name, presence: true, length: { maximum: 40 }
  validates :user_id, presence: true

end
