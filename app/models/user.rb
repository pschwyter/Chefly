class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_and_belongs_to_many :ingredients
	has_many :comments
	has_many :ratings
	has_many :favourites

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.name = auth.info.name   # assuming the user model has a name
	    user.avatar = auth.info.image # assuming the user model has an image
	  end
	end

	def has_favourited(recipe_id)
		recipe = Recipe.find_by(recipe_id: recipe_id)
		Favourite.exists?(recipe: recipe, user: self)
	end

	def unfavourite(recipe_id)
		recipe = Recipe.find_by(recipe_id: recipe_id)
		favourite = Favourite.find_by(recipe: recipe, user: self)
		favourite.destroy
	end
end
