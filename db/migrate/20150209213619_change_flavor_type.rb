class ChangeFlavorType < ActiveRecord::Migration
  def change
  	change_column :recipes, :salty, :decimal
  	change_column :recipes, :sweet, :decimal
  	change_column :recipes, :bitter, :decimal
  	change_column :recipes, :meaty, :decimal
  	change_column :recipes, :piquant, :decimal

  end
end
