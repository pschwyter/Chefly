class FoodToFork
  require 'recipe.rb'
  include HTTParty
  base_uri 'http://food2fork.com'
  attr_accessor :recipe_id, :title, :image_url

  @apiKey = "b05c45fc8ed1a6c807983eaf1d30e6b0"

  def self.all
  	recipes = JSON.parse(get("/api/search?key=" + @apiKey))['recipes']
    recipes.each do|recipe|
      Recipe.find_or_create_by(name: recipe['title'])
      # binding.pry
    end
    # binding.pry
  end

  def self.find_by_ingredients(ingredients)
    encoded_ingredients = URI.encode(ingredients)

    JSON.parse(get("/api/search?key=" + @apiKey + "&q=" + encoded_ingredients))['recipes']
  end

  def self.find_recipe(recipe_id)
    recipe_id = recipe_id.to_s
    JSON.parse(get("/api/get?key=" + @apiKey + "&rId=" + recipe_id))['recipe']
  end

  # def initialize(options)
  # end
end