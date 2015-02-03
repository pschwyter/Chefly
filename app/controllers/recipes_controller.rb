class RecipesController < ApplicationController
  def index
	  @recipes = Recipe.ingredient_search(params[:ingredient])
	end

  def show
  end
  
end

