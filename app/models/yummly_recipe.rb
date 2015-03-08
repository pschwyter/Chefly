class YummlyRecipe
	include HTTParty
	base_uri 'http://api.yummly.com'
	@app_id = YUMMLY_APP_ID
	@api_key = YUMMLY_API_KEY

	attr_accessor :id, :name, :image, :ingredient_lines

	def initialize(options)
		@name = options['name']
		@ingredient_lines = options['ingredientLines']
		@image = options['images'][0]['imageUrlsBySize']['90'].sub(/([=])\w+/,'=s600-c')
	end

	def self.find(recipe_id)
		# create the recipe in our DB if it doesn't already exist
		r = Recipe.find_or_create_by(recipe_id: recipe_id)

		if r.name == nil
			yummly_response = get_yummly_recipe(recipe_id)
			r = save_recipe(r,yummly_response)
		end
		r
	end

	def self.get_yummly_recipe(recipe_id)
		get("/v1/api/recipe/#{recipe_id}?_app_id=#{@app_id}&_app_key=#{@api_key}&q=#{recipe_id}").parsed_response
	end

	def self.save_recipe(r, yummly_response)
			unless yummly_response['nutritionEstimates'].select{|nut| nut['attribute'] == 'ENERC_KCAL'}.empty?
				r.calories = yummly_response['nutritionEstimates'].select{|nut| nut['attribute'] == 'ENERC_KCAL'}[0]['value']
			end

			r.recipe_id = yummly_response['id']
			r.name = yummly_response['name']
			r.rating = yummly_response['rating']
			r.image_url = yummly_response['images'][0]['imageUrlsBySize']['90']
			r.update_attributes(ingredient_lines: yummly_response['ingredientLines'])
			r.total_time_in_seconds = yummly_response['totalTimeInSeconds']
			r.number_of_servings = yummly_response['numberOfServings']
			r.yield = yummly_response['yield']
			# yummly attribution
			r.yummly_html = yummly_response['attribution']['html']
			r.yummly_url = yummly_response['attribution']['url']
			r.yummly_text = yummly_response['attribution']['text']
			r.yummly_logo = yummly_response['attribution']['logo']
			# source information
			r.source_recipe_url = yummly_response['source']['sourceRecipeUrl']
			r.source_site_url = yummly_response['source']['sourceSiteUrl']
			r.source_display_name = yummly_response['source']['sourceDisplayName']
			# flavor information
			r.salty = yummly_response['flavors']['Salty']
			r.sour = yummly_response['flavors']['Sour']
			r.sweet = yummly_response['flavors']['Sweet']
			r.bitter = yummly_response['flavors']['Bitter']
			r.meaty = yummly_response['flavors']['Meaty']
			r.piquant = yummly_response['flavors']['Piquant']
			r.save
			if yummly_response['attributes']['cuisine']
				yummly_response['attributes']['cuisine'].each do |cuisine_name|
					cuisine = Cuisine.find_or_create_by(name: cuisine)
					cuisine.name = cuisine_name
					r.cuisines << cuisine
					cuisine.save
				end
			end
			if yummly_response['attributes']['course']
				yummly_response['attributes']['course'].each do |course_name|
					course = Course.find_or_create_by(name: course_name)
					course.name = course_name
					r.courses << course
					course.save
				end
			end

			r
	end


end