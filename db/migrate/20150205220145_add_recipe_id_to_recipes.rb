class AddRecipeIdToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes, :recipe_id, :integer
  end
end
