class FoodItem < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order('expiration_date ASC') }
  validates :name, presence: true
  validates :user_id, presence: true
  validate :check_expiration_date

  def check_expiration_date
    errors.add(:error_messages, "Expiration date must be on or past the current day!") if expiration_date < Date.today
  end

end
