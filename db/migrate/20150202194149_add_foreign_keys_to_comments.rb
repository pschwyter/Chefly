class AddForeignKeysToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :user_id, :integer
  	add_column :comments, :recipe_id, :integer
  end
end
