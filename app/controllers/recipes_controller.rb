class RecipesController < ApplicationController
  def index
  	if params[:ingredients]
		  @recipes = Yummly.find_by_ingredients(params[:ingredients])
  	else
		  @recipes = Recipe.all
		end

	  respond_to do |format|
	  	format.html
	  	format.js
	  end

	end

  def show
  	@recipe = Yummly.find(params[:id])
  end

end

