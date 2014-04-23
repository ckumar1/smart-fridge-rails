class FoodItem < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order('expiration_date ASC') }
  validates :name, presence: true
  validates :user_id, presence: true


end
