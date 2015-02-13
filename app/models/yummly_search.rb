class YummlySearch
	include HTTParty
	base_uri 'http://api.yummly.com'
	@app_id = '548c220e'
	@api_key = "b542c6f2342b145ce8f524981bc75653"

	attr_accessor :id, :name, :image, :time, :ingredientsNum

	def initialize(options)
		@id = options["id"]
		@name = options["recipeName"]
		if options['smallImageUrls']
			@image = options["smallImageUrls"][0].sub(/([=])\w+/,'=s500')
		end
		@ingredients_lines = options["ingredientLines"]
		if options["totalTimeInSeconds"] != nil
			@time = ((options["totalTimeInSeconds"] / 60 * 5) / 5).to_i
		else
			@time = "NA"
		end
		@ingredientsNum = options["ingredients"].count
	end

	def self.all(options = {})
		response = get("/v1/api/recipes?_app_id=#{@app_id}&_app_key=#{@api_key}", {query: options})

		response["matches"].map do |r|
			YummlySearch.new(r)
		end
	end

	def self.find_by_ingredients(ingredients)
		encoded_ingredients = URI.encode(ingredients)

		response = get("/v1/api/recipes?_app_id=#{@app_id}&_app_key=#{@api_key}&q=" + encoded_ingredients)

		response["matches"].map do |yummly_recipe|
			new_recipe = Recipe.find_or_create_by(recipe_id: yummly_recipe['id']) do |r|
				r.recipe_id = yummly_recipe['id']
				r.save

			yummly_recipe['ingredients'].each do |yummly_ingredient|
				Ingredient.find_or_create_by(name: yummly_ingredient) do |i|
					i.name = yummly_ingredient
					i.save
					r.ingredients << i
				end
			end
			end
			YummlySearch.new(yummly_recipe)
		end
	end

	def self.find(recipe_id)
		response = get("/v1/api/recipe/#{recipe_id}?_app_id=#{@app_id}&_app_key=#{@api_key}&q=#{recipe_id}").parsed_response
		response
	end
end
