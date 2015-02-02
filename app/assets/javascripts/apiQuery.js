$(document).on('ready page:load' function() {

	apiKey = "b05c45fc8ed1a6c807983eaf1d30e6b0";

	function findRecipes() {

		var ingredients = "";
		var url = "http://food2fork.com/api/search?"
			+ "key=" + apiKey
			+ "&q=" + ingredients; 

		$.ajax({
			type: "GET",
			dataType: 'json',
			cache: false,
			url: url,
			success: function (data) {
				alert('success');
				console.log(data);
			}
		});
	}

	function recipeDetails() {

		var recipeId = $(this).data("recipe_id");
		var url = "http://food2fork.com/api/search?"
			+ "key=" + apiKey
			+ "&rId=" + recipeId; 

		$.ajax({
			type: "GET",
			dataType: 'json',
			cache: false,
			url: url,
			success: function (data) {
				alert('success');
				console.log(data);
			}
		});
	}
});
