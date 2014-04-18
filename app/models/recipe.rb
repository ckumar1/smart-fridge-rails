class Recipe < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order('name ASC') }
  validates :name, presence: true, length: { maximum: 80 }
  #validates :user_id, presence: true
  validates :directions, presence: true
  validates :notes, presence:true
end
