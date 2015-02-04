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

	def self.find(recipe_id)
		JSON.parse(get("/api/get?key=" + @apiKey.to_s + "&rId=" + recipe_id))["recipe"]
	end
end