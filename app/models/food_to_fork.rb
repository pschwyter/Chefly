class FoodToFork
  include HTTParty
  base_uri 'http://food2fork.com'
  attr_accessor :recipe_id, :title, :image_url

  @apiKey = "b05c45fc8ed1a6c807983eaf1d30e6b0"

  def self.all
  	get("/api/search?key=" + @apiKey.to_s)
  end

  # def initialize(options)
  # end
end





	

  #   $('.test-button').on('click', function() {

  #       var API_SEARCH_ENDPOINT = "/search.jsonp";
		# var ingredients = encodeURI("chicken");
		# var url = "http://food2fork.com/api/search.jsonp?key=" 
  #           + apiKey
		# 	+ "&q=" + ingredients; 