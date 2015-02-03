class RemoveIngredientKeyFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :ingredient_id
  end
end
