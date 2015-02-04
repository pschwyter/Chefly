// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){



	$("#add-ingredient").on('click', function(){
		var ingredients = {$('#ingredient-box div').each(function(index,div){ return $(div).data('ingredient'));})};
		$('#ingredient-box').append('<div data-ingredient='+ ingredient +'>' + ingredient + '</div>');
	});

	$('#recipe-search').submit(function(e) {
		e.preventDefault();  
    var valuesToSubmit = {ingredient: $('#ingredient-box div').data('ingredient')};
    $.ajax({
        type: "GET",
        url: $(this).attr('action'), //sumbits it to the given url of the form
        data: valuesToSubmit,
        dataType: "SCRIPT" // you want a difference between normal and ajax-calls, and json is standard
    })
	});

});