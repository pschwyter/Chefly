class AddF2FFieldsToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes, :title, :string
  	add_column :recipes, :image_url, :string
  	add_column :recipes, :ingredients, :string, array: true, default: []
  	add_column :recipes, :social_rank, :integer
  	add_column :recipes, :source_url, :string
  	add_column :recipes, :publisher_url, :string
  	add_column :recipes, :publisher, :string
  	add_column :recipes, :f2f_url, :string
  end
end