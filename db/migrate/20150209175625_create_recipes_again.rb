class CreateRecipesAgain < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :recipe_id
    	t.string :name
    	t.string :image_url
    	t.integer :rating
    	t.integer :number_of_servings
    	t.integer :number_of_servings
    	t.string :yield
    	# yummly attribution
    	t.string :yummly_html
    	t.string :yummly_url
    	t.string :yummly_text
    	t.string :yummly_logo
    	# source information
    	t.string :source_recipe_url
    	t.string :source_site_url
    	t.string :source_display_name
    	# flavor information
    	t.integer :salty
    	t.integer :sour
    	t.integer :sweet
    	t.integer :bitter
    	t.integer :meaty
    	t.integer :piquant
    end
  end
end
