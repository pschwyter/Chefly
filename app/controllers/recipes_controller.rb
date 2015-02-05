class RecipesController < ApplicationController
  def index
  	if params[:ingredients]
		  @recipes = FoodToFork.find_by_ingredients(params[:ingredients])
  	else
		  @recipes = FoodToFork.all
		end

	  respond_to do |format|
	  	format.html
	  	format.js
	  end

	end

  def show
  	@recipe = FoodToFork.find(params[:id])
  end

end

