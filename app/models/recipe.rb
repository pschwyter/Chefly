class Recipe < ActiveRecord::Base
	has_and_belongs_to_many :ingredients
	has_many :comments
	has_many :ratings

	def self.ingredient_search(ingredient)
		if ingredient
			Ingredient.where(name: ingredient).first.recipes
		else
			Recipe.all
		end
	end
end
