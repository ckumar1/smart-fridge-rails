class AddUserIdToFoodItem < ActiveRecord::Migration
  def change
    add_column :food_items, :user_id, :integer
  end
end
