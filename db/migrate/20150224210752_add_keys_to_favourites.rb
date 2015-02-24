class AddKeysToFavourites < ActiveRecord::Migration
  def change
  	add_column :favourites, :user_id, :integer
  	add_column :favourites, :recipe_id, :integer
  end
end
