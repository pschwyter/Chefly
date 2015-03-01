class YummlySearch
	include HTTParty
	base_uri 'http://api.yummly.com'
	@app_id = YUMMLY_APP_ID
	@api_key = YUMMLY_API_KEY

	attr_accessor :id, :name, :image, :time, :ingredientsNum

	def initialize(options)
		@id = options["id"]
		@name = options["recipeName"]
		if options['smallImageUrls']
			@image = options["smallImageUrls"][0].sub(/([=])\w+/,'=s650')
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

		included_ingredients_string = parse_ingredients(ingredients)

		response = get("/v1/api/recipes?_app_id=#{@app_id}&_app_key=#{@api_key}&#{included_ingredients_string}&requirePictures=true")

		response["matches"].map do |yummly_recipe|
			new_recipe = Recipe.find_or_create_by(recipe_id: yummly_recipe['id']) do |r|
				# binding.pry
				r.recipe_id = yummly_recipe['id']
				r.save
				
				yummly_recipe['ingredients'].each do |yummly_ingredient|
					Ingredient.find_or_create_by(name: yummly_ingredient) do |i|
						i.name = yummly_ingredient
						i.save
						r.ingredients << i
						r.save
					end
				end

				yummly_recipe['ingredients'].each do |yummly_ingredient|
					if Ingredient.exists?(name: yummly_ingredient)
						i = Ingredient.find_by(name: yummly_ingredient)
						r.ingredients << i 
					else
						i = Ingredient.create(name: yummly_ingredient)
						r.ingredients << i
					end
					r.save
				end

			end
			YummlySearch.new(yummly_recipe)
		end
	end

	def self.find(recipe_id)
		response = get("/v1/api/recipe/#{recipe_id}?_app_id=#{@app_id}&_app_key=#{@api_key}&q=#{recipe_id}").parsed_response
		response
	end

	def self.parse_ingredients(ingredients)
		remove_commas = ingredients.sub(/(,,)/,',').sub(/^,/,'').sub(/,$/,'')
		ingredients_array = remove_commas.split(',')
		encoded_ingredients_array = ingredients_array.map {|i| URI.encode(i)}
		included_ingredients_array = encoded_ingredients_array.map {|i| "allowedIngredient[]=#{i}"}
		included_ingredients_string = included_ingredients_array.join("&")
	end

end
