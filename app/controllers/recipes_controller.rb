class RecipesController < ApplicationController
  def index
  	if params[:ingredients]
		  @api_recipes = FoodToFork.find_by_ingredients(params[:ingredients])
  	else
		  @recipes = FoodToFork.all
		end

	  respond_to do |format|
	  	format.html
	  	format.js
	  end
	  # binding.pry
	end

  def show
  	@api_recipe = FoodToFork.find_recipe(params[:id])
  end

end

