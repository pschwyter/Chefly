class RecipesController < ApplicationController
  def index
	  @recipes = Recipe.ingredient_search(params[:ingredient])
	  @api_recipes = FoodToFork.all

	  respond_to do |format|
	  	format.html
	  	format.js
	  end
	  binding.pry
	end

  def show
  end

end

