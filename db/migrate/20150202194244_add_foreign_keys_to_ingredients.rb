class AddForeignKeysToIngredients < ActiveRecord::Migration
  def change
  	add_column :ingredients, :user_id, :integer
  	add_column :ingredients, :recipe_id, :integer
  end
end
