class AddForeignKeysToRatings < ActiveRecord::Migration
  def change
  	add_column :ratings, :user_id, :integer
  	add_column :ratings, :recipe_id, :integer
  end
end
