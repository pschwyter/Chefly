$(document).on('ready page:load', function() {

	var apiKey = "b05c45fc8ed1a6c807983eaf1d30e6b0";

    $('.test-button').on('click', function() {

        var API_SEARCH_ENDPOINT = "/search.jsonp";
		var ingredients = encodeURI("chicken");
		var url = "http://food2fork.com/api/search.jsonp?key=" 
            + apiKey
			+ "&q=" + ingredients; 

		$.ajax({
            type: 'GET',
			url: url,
            dataType: "jsonp",
			success: findRecipesCallback
		});
	});

	function findRecipesCallback(data) {
		console.log(data);

        var recipeCount = data.count;
        var recipes = data.recipes;

        for (var i = 0; i < recipeCount; i++) {
            $('.test-append').append('<div data-id=' + recipes[i].recipe_id + ' class="recipes" >' + recipes[i].title + '</div>');
        }
	}


	$('.test-append').on('click', ".recipes", function() {

		var recipeId = $(this).data("id");
		var url = "http://food2fork.com/api/get.jsonp?key=" 
            + apiKey
			+ "&rId=" + recipeId; 

		$.ajax({
			type: "GET",
			url: url,
            dataType: 'jsonp',
			success: recipeDetailsCallback
		});
	});

	function recipeDetailsCallback(data) {
		console.log(data);
        console.log(data.recipe.image_url);
        $('.test-append').html("<img src=" + data.recipe.image_url + " />" );
	}
});














