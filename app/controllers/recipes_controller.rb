class RecipesController < ApplicationController
  def index
  	if params[:ingredients] != "" && params[:ingredients] != nil
		  @recipes = YummlySearch.find_by_ingredients(params[:ingredients])
  	else
		  @recipes = YummlySearch.all
		end
	  respond_to do |format|
	  	format.html
	  	format.js
	  end

	end

  def show_recipe
    # returns a recipe model object!!
  	@recipe = YummlyRecipe.find(params[:id])

  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

end

