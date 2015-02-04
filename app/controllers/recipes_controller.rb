class RecipesController < ApplicationController
	def index
		@recipes = Recipe.ingredient_search(params[:ingredient])
		@api_recipes = FoodToFork.all
	end

	def show
	end

end

