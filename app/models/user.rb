class User < ActiveRecord::Base
	has_and_belongs_to_many :ingredients
	has_many :comments
	has_many :ratings
end
