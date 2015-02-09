class DropRecipes < ActiveRecord::Migration
  def change
  	drop_table :recipes
  end
end
