class RemoveUserKeyFromIngredients < ActiveRecord::Migration
  def change
  	remove_column :ingredients, :user_id
  end
end
