class ChangeDirectionsFormatInRecipes < ActiveRecord::Migration
  def change
    change_column :recipes, :directions, :text
  end
end
