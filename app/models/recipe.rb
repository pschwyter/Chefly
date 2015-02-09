class Recipe < ActiveRecord::Base
	has_and_belongs_to_many :ingredients
	has_and_belongs_to_many :courses
	has_and_belongs_to_many :cuisines
	has_many :comments
	has_many :ratings

	# def self.ingredient_search(ingredient)
	# 	if ingredient && ingredient != ''
	# 		Ingredient.where(name: ingredient).first.recipes
	# 	else
	# 		Recipe.all
	# 	end
	# end
end
