class Recipe < ActiveRecord::Base
	has_many :ingredients
	has_many :comments
	has_many :ratings
end
