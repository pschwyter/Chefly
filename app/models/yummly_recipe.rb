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
		# create the recipe in our DB if it doesn't already exist
		r = Recipe.find_by(recipe_id: recipe_id)
		unless r.name 
			response = get("/v1/api/recipe/#{recipe_id}?_app_id=#{@app_id}&_app_key=#{@api_key}&q=#{recipe_id}").parsed_response
			binding.pry
			r.recipe_id = response['id']
			r.name = response['name']
			r.rating = response['rating']
			r.image_url = response['images'][0]['imageUrlsBySize']['90']
			r.update_attributes(ingredient_lines: response['ingredientLines'])
			r.total_time_in_seconds = response['totalTimeInSeconds']
			r.number_of_servings = response['numberOfServings']
			r.yield = response['yield']
			# yummly attribution
			r.yummly_html = response['attribution']['html']
			r.yummly_url = response['attribution']['url']
			r.yummly_text = response['attribution']['text']
			r.yummly_logo = response['attribution']['logo']
			# source information
			r.source_recipe_url = response['source']['sourceRecipeUrl']
			r.source_site_url = response['source']['sourceSiteUrl']
			r.source_display_name = response['source']['sourceDisplayName']
			# flavor information
			r.salty = response['flavors']['Salty']
			r.sour = response['flavors']['Sour']
			r.sweet = response['flavors']['Sweet']
			r.bitter = response['flavors']['Bitter']
			r.meaty = response['flavors']['Meaty']
			r.piquant = response['flavors']['Piquant']
			r.save
			if response['attributes']['cuisine']
				response['attributes']['cuisine'].each do |cuisine_name|
					cuisine = Cuisine.find_or_create_by(name: cuisine)
					cuisine.name = cuisine_name
					r.cuisines << cuisine
					cuisine.save
				end
			end
			if response['attributes']['course']
				response['attributes']['course'].each do |course_name|
					course = Course.find_or_create_by(name: course_name)
					course.name = course_name
					r.courses << course
					course.save
				end
			end
		end
		r
	end


end