class Yummly
	include HTTParty
	base_uri 'http://api.yummly.com'
	@app_id = '548c220e'
	@api_key = "b542c6f2342b145ce8f524981bc75653"

	attr_accessor :id, :name, :image

	def initialize(options)
		@id = options["id"]
		@name = options["recipeName"]
		@image = options["smallImageUrls"][0].sub(/([=])\w+/,'=s600')
	end

	def self.all(options = {})
		response = get("/v1/api/recipes?_app_id=#{@app_id}&_app_key=#{@api_key}", {query: options})

		response["matches"].map do |r|
			Yummly.new(r)
		end
	end

  def self.find_by_ingredients(ingredients)
    encoded_ingredients = URI.encode(ingredients)
    response = get("/v1/api/recipes?_app_id=#{@app_id}&_app_key=#{@api_key}&q=" + encoded_ingredients)
    binding.pry
    response["matches"].map do |r|
      Yummly.new(r)
    end

  end

	def self.find(recipe_id)
		response = get("/v1/api/recipe/#{recipe_id}?_app_id=#{@app_id}&_app_key=#{@api_key}&q=#{recipe_id}").parsed_response
		binding.pry
		response
	end
end
