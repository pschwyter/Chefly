class CuisinesRecipes < ActiveRecord::Migration
  def change
  	create_table :cuisines_recipes, id: false do |t|
  		t.integer :cuisine_id
  		t.integer :recipe_id
  	end

  	add_index :cuisines_recipes, :cuisine_id
  	add_index :cuisines_recipes, :recipe_id
  end
end
