// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){

	var callback = function(){
		var ingredient = $('#ingredient').val();
		$('#ingredient').val('');
		$('#ingredient-box').append('<div><button type="button" class="ingredient-in-box" data-ingredient='+ ingredient +'>' + ingredient + '</button></div>');

		$('button.ingredient-in-box').on('click', function(){
			$(this).remove();
		});
	}

	$('#ingredient').keypress(function(event){
		if (event.which == 13) {
			callback();
		}       
	});

	$("#add-ingredient").on('click', callback);

	// Prepare ingredient query string
	$('#recipe-search').submit(function(e) {

		e.preventDefault();  
		var ingredients = $('#ingredient-box div').map(function(index, div){return $(div).text()});
		var ingredients_array = [];

		ingredients.each(function(index,value){ingredients_array.push(value)});
		ingredients_string = ingredients_array.join(',');
	    // var valuesToSubmit = {ingredients: string_ingredients};
	    var valuesToSubmit = {ingredients: ingredients_string};
	    console.log(valuesToSubmit);

	    $.ajax({
	    	type: "GET",
	        url: $(this).attr('action'), //sumbits it to the given url of the form
	        data: valuesToSubmit,
	        dataType: "SCRIPT" // you want a difference between normal and ajax-calls, and json is standard
	    }).fail(function(){
	    	console.log('fail');
	    });
	});

	var child = 2;
	$('nav').on('click', function() {
		var numRecipes = $("#search-results").children().length;
		if (child > numRecipes) { child = 1; }

		$("#search-results").children().hide();
		$("#search-results .recipe-thumb:nth-child(" + child + ")").show();
		child ++;
	});
});












