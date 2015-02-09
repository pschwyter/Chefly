class CoursesRecipes < ActiveRecord::Migration
  def change
  	create_table :courses_recipes, id: false do |t|
  		t.integer :course_id
  		t.integer :recipe_id
  	end

  	add_index :courses_recipes, :course_id
  	add_index :courses_recipes, :recipe_id
  end
end
