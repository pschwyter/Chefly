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

  def show_recipe
  	@recipe = YummlyRecipe.find(params[:id])

  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

end

