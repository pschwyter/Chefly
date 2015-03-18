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

	def image_url_size(size)
		url = self.image_url
		new_url = url.sub(/([=])\w+/,"=s#{size}")
	end

	def readable_time
		minutes = (self.total_time_in_seconds % 3600)/60
		return "#{minutes} min"
	end
end
