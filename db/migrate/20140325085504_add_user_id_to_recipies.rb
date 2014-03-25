class AddUserIdToRecipies < ActiveRecord::Migration
  def change
    add_column :recipes, :user_id, :integer
    add_index :recipes, :user_id
    add_index :food_items, :user_id
  end
end
