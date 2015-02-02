class IngredientsUsers < ActiveRecord::Migration
  def change
  	create_table :ingredients_users, id: false do |t|
  		t.integer :ingredient_id
  		t.integer :user_id
  	end

  	add_index :ingredients_users, :ingredient_id
  	add_index :ingredients_users, :user_id
  end
end
