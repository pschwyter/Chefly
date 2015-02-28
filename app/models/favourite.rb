class Favourite < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipe


	def recipe_name
		self.recipe.name
	end

	def recipe_time
		self.recipe.readable_time
	end

	def recipe_ingredients_count
		self.recipe.ingredient_lines.count
	end

	def recipe_readable_time
		self.recipe.readable_time
	end
end
