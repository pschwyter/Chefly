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
  	@recipe = Recipe.find_or_create_by(f2f_id: params[:id]) do |r|
  		@api_recipe = FoodToFork.find(params[:id])
  		r.f2f_id = @api_recipe["recipe_id"].to_i
  		r.title = @api_recipe["title"]
  		r.source = @api_recipe["source_url"]
  		r.f2f_ingredients = @api_recipe["ingredients"].join("/")
  		r.image = @api_recipe["image_url"]
  		r.social_rank = @api_recipe["social_rank"]
  		r.f2f_url = @api_recipe["f2f_url"]
  		r.publisher = @api_recipe["publisher_url"]
  	end
  end

end

