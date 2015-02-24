class FavouritesController < ApplicationController

	def create
		recipe = Recipe.find_by(recipe_id: favourite_params[:recipe_id])
		user = current_user
		Favourite.create(recipe: recipe, user: user)
		redirect_to '/recipes/index'
	end

	def destroy
		favourite = Favourite.find(favourite_params[:id])
		favourite.destroy
	end

	private

	def favourite_params
		params.require(:favourite).permit(:recipe_id)
	end
end
