class Recipe < ActiveRecord::Base
	has_and_belongs_to_many :ingredients
	has_many :comments
	has_many :ratings


	def ingredient_search(ingredient)
		if ingredient
			Recipe.all.where(ingredient)
		else
			Recipe.all
		end
	end
end
