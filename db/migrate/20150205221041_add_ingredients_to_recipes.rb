class AddIngredientsToRecipes < ActiveRecord::Migration
  def change
  	change_table :recipes do |t|
	  	t.string :ftof_ingredients, array: true
	  end
  end
end
