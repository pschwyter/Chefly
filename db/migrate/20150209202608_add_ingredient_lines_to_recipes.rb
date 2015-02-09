class AddIngredientLinesToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes, :ingredient_lines, :string, array: true, default: []
  end
end
