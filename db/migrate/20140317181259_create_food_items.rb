class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.string :description
      t.date :expiration_date
      t.integer :calories

      t.timestamps
    end
  end
end
