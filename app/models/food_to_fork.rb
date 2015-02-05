class FoodToFork
	include HTTParty
	base_uri 'http://food2fork.com'
	@apiKey = "b05c45fc8ed1a6c807983eaf1d30e6b0"

	attr_accessor :id, :title, :image

	def initialize(options)
		@id = options["recipe_id"]
		@title = options["title"]
		@image = options["image_url"]
	end

	def self.all(options = {})
		response = JSON.parse(get("/api/search?key=" + @apiKey.to_s, {query: options}))

		response["recipes"].map do |r|
			FoodToFork.new(r)
		end
	end

  def self.find_by_ingredients(ingredients)
    encoded_ingredients = URI.encode(ingredients)

    response = JSON.parse(get("/api/search?key=" + @apiKey + "&q=" + encoded_ingredients))

    response["recipes"].map do |r|
      FoodToFork.new(r)
    end
  end

	def self.find(recipe_id)
		recipe = Recipe.find_or_create_by(recipe_id: recipe_id) do |r|
			response = JSON.parse(get("/api/get?key=" + @apiKey.to_s + "&rId=" + recipe_id))["recipe"]
	    r.title = response['title']
	    r.recipe_id = response['recipe_id']
	    r.image_url = response['image_url']
	    r.update_attributes(ftof_ingredients: response['ingredients'])
			r.social_rank = response['social_rank']
			r.source_url = response['source_url']
			r.publisher_url = response['publisher_url']
			r.publisher = response['publisher']
			r.f2f_url = response['f2f_url']
	    r.save
		end
	end
end


