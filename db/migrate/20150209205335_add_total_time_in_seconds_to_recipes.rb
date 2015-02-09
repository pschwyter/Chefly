class AddTotalTimeInSecondsToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes, :total_time_in_seconds, :integer
  end
end
