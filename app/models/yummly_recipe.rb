class YummlyRecipe
	include HTTParty
	base_uri 'http://api.yummly.com'
	@app_id = '548c220e'
	@api_key = "b542c6f2342b145ce8f524981bc75653"

	attr_accessor :id, :name, :image, :ingredient_lines

	def initialize(options)
		@name = options['name']
		@ingredient_lines = options['ingredientLines']
		@image = options['images'][0]['imageUrlsBySize']['90'].sub(/([=])\w+/,'=s600-c')
	end

	def self.find(recipe_id)
		response = get("/v1/api/recipe/#{recipe_id}?_app_id=#{@app_id}&_app_key=#{@api_key}&q=#{recipe_id}").parsed_response
		YummlyRecipe.new(response)
	end


end