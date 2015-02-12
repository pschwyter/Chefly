class RecipesController < ApplicationController
  def index
  	if params[:ingredients]
		  @recipes = YummlySearch.find_by_ingredients(params[:ingredients])
  	else
		  @recipes = YummlySearch.all
		end
	  respond_to do |format|
	  	format.html
	  	format.js
	  end

	end

  def show
  	# @recipe = YummlyRecipe.find(params[:id])
  	@recipe = Recipe.first
  end

end

