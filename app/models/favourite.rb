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

	def recipe_id
		self.recipe.recipe_id
	end

	def recipe_calories
		self.recipe.calories
	end

	def recipe_source_recipe_url
		self.recipe.source_recipe_url
	end

	def recipe_source_display_name
		self.recipe.source_display_name
	end

	def recipe_number_of_servings
		self.recipe.number_of_servings
	end
end
