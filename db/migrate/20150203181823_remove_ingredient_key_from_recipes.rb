class RemoveIngredientKeyFromRecipes < ActiveRecord::Migration
  def change
  	remove_column :recipes, :ingredient_id
  end
end
