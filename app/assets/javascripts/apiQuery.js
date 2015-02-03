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
	}

	// function recipeDetails() {

	// 	var recipeId = $(this).data("recipe_id");
	// 	var url = "http://food2fork.com/api/search?"
	// 		+ "key=" + apiKey
	// 		+ "&rId=" + recipeId; 

	// 	$.ajax({
	// 		type: "GET",
	// 		dataType: 'json',
	// 		url: url,
	// 		success: recipeDetailsCallback
	// 	});
	// }

	// function recipeDetailsCallback(data) {
	// 	alert('success');
	// 	console.log(data);
	// }
});











