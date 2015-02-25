class FavouritesController < ApplicationController

	def index
		@favourites = current_user.favourites
	end

	def create
		recipe = Recipe.find_by(recipe_id: favourite_params[:recipe_id])
		Favourite.create(recipe: recipe, user: current_user)
		redirect_to '/recipes/index'
	end

	def destroy
		current_user.unfavourite(favourite_params[:recipe_id])
		redirect_to '/recipes/index'
	end

	private

	def favourite_params
		params.require(:favourite).permit(:recipe_id)
	end
	
end
