class AddColumnsToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :title, :string
    add_column :recipes, :source, :string
    add_column :recipes, :f2f_id, :integer
    add_column :recipes, :f2f_ingredients, :text
    add_column :recipes, :image, :string
    add_column :recipes, :social_rank, :integer
    add_column :recipes, :f2f_url, :string
    add_column :recipes, :publisher, :string
  end
end
