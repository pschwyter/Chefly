$(document).ready(function(){

	var favouritingCallback = function() {
		// $('.fav').on('click', function(e) {
		// 	e.preventDefault();
		// 	e.stopPropagation();
		// 	var $self = $(this)
		// 		, $recipe_id = $(this).data('recipe-id')
		// 		, $recipeContainer = $(this).parent()
		// 		;
		// 	if ($self.hasClass('fav-button')) {
		// 		$('button', $recipeContainer).removeClass('fa-heart-o');
		// 		$('button', $recipeContainer).removeClass('fav-button');
		// 		$('button', $recipeContainer).addClass('unfav-button');
		// 		$('button', $recipeContainer).addClass('fa-heart');
		// 		$('i', $recipeContainer).addClass('fa-heart-o');
		// 		$('i', $recipeContainer).removeClass('fa-heart');
		// 		$.ajax({
		// 			method: 'POST',
		// 			url: '/favourite_recipe',
		// 			data: { favourite: {recipe_id: $recipe_id} }
		// 		});
		// 	} else if ($self.hasClass('unfav-button')) {
		// 		$('button', $recipeContainer).removeClass('fa-heart');
		// 		$('button', $recipeContainer).removeClass('unfav-button');
		// 		$('button', $recipeContainer).addClass('fav-button');
		// 		$('button', $recipeContainer).addClass('fa-heart-o');
		// 		$('i', $recipeContainer).addClass('fa-heart');
		// 		$('i', $recipeContainer).removeClass('fa-heart-o');

		// 		$.ajax({
		// 			method: 'DELETE',
		// 			url: '/favourite_recipe',
		// 			data: { favourite: {recipe_id: $recipe_id} }
		// 		});	
		// 	}
		// });
	}

	var flipCallback = function() {
		// $('.recipe-flip').on('click', function(event){
		// 	var target = $(event.target);
		// 	var that = this;
		// 	if(!target.is('.fav, .fav *')) {
		// 		$('.inner').toggleClass('flipped');
		// 		var recipeId = $(this).data("id");
		// 		var id = {id: recipeId};
		// 	}

		// 	favouritingCallback();
		// });
	}
	

	var callback = function(){
		// var ingredient = $('#ingredient').val();
		// $('#ingredient').val('');
		// $('#ingredient-box').append('<div class="tag-box"><button type="button" class="ingredient-in-box tag" data-ingredient='+ ingredient +'>' + ingredient + '</button></div>');

		// // need to add click-to-remove each time an ingredient is added 
		// $('button.ingredient-in-box').on('click', function(){
		// 	$(this).remove();
		// 	// removing an ingredient makes another API call
		// 	recipeGet();
		// });

		// recipeGet();
	}


	var child = 1;
	var imageCallback = function() {
		// var imgRight = currentIndex +2;
		// var imgLeft = currentIndex;

		// recipeCount = $(".search-results").children().length;
		// if (imgRight > recipeCount) { imgRight = 1; }
		// if (imgLeft < 1) { imgLeft = recipeCount; }

		// var imageUrlRight = $(".search-results .recipe-thumb:nth-child(" + imgRight + ") .inner img").attr('src');
		// var imageUrlLeft = $(".search-results .recipe-thumb:nth-child(" + imgLeft + ") .inner img").attr('src');
		
		// if (typeof imageUrlRight != "undefined") {
		// 	$('.right-swipe').css('background-image', 'url(' + imageUrlRight + ')');
		// } else {
		// 	console.log("yolo");
		// 	$('.right-swipe').css('background-image', 'url("assets/info-icon.png")');
		// }

		// if (typeof imageUrlLeft != "undefined") {
		// 	$('.left-swipe').css('background-image', 'url(' + imageUrlLeft + ')');
		// } else {
		// 	$('.left-swipe').css('background-image', 'url("assets/info-icon.png")');
		// }
	}

	var recipeGet = function() {
		// var ingredients = $('#ingredient-box div').map(function(index, div){return $(div).text()});
		// var ingredients_array = [];

		// ingredients.each(function(index,value){ingredients_array.push(value)});
		// ingredients_string = ingredients_array.join(',');
		// ingredients_string = ingredients_string.replace(/^[,\s]+|[,\s]+$/g, '').replace(/,[,\s]*,/g, ',');

  //   // var valuesToSubmit = {ingredients: string_ingredients};
  //   var valuesToSubmit = {ingredients: ingredients_string};
  //   console.log(valuesToSubmit);

  //   $.ajax({
  //   	type: "GET",
  //     url: "/recipes", //sumbits it to the given url of the form
  //     data: valuesToSubmit,
  //     dataType: "SCRIPT", // you want a difference between normal and ajax-calls, and json is standard
  //     beforeSend:function(){
  //     	$(".loading").show();
  //     	$(".search-results, .swipe").hide();
  //     },
  //     fail:function(){
  //     	console.log('fail');
  //     },
  //     success:function(){
  //     	$(".loading").hide();
  //     	$(".search-results, .swipe").show();
  //     	checkCookie();

  //     	recipeCount = $('.search-results > div').length;
  //     	console.log('success, recipe count: ' + recipeCount);
  //     	var currentIndex = 0;
  //     	/* add the active class to the first item to hide all the others */
  //     	$('.search-results > div:eq(' + currentIndex + ')').addClass('active');
  //     	imageCallback();
  //     	flipCallback();
  //     	favouritingCallback();
	 //    	// adds textfill to first result
	 //    	$('.title').textfill({ maxFontPixels: 200 });

	 //    	var $firstRecipe 	= $('.active'),
	 //    	recipeId 			= $firstRecipe.data("id"),
	 //    	id 						= {id: recipeId};

	 //    	$.ajax({
	 //    		type: "GET",
		// 	    url: '/show_recipe', //submits it to the given url of the form
		// 	    data: id,
		// 	    dataType: "SCRIPT" // you want a difference between normal and ajax-calls, and json is standard
		// 		}).success(function(){
		// 			$('.recipe-name', $firstRecipe).textfill({ maxFontPixels: 200 });
		// 		});
		// 	}
		// });
	}

recipeGet();

$('#ingredient').keypress(function(event){
	// if (event.which == 13) {
	// 	callback();
	// }       
});

$("#add-ingredient").on('click', callback);

	//Add hover class to recipe thumb when hovering over buttons

	// Transition out recipe result on clicking next
	// var currentIndex = 0;


	// hot-keys!

	$(document).keydown(function(event){

		// if (($('#ingredient').is(':focus') == false) || $('#ingredient').val() == "" ) {

		// 	// up-arrow
		// 	if (event.which == 38) {
		// 		$('.recipe-thumb.active').click();
		// 		return;
		// 	}
		// 	// left-arrow
		// 	if (event.which == 37) {
		// 		event.preventDefault();
		// 		$('.left-swipe').click();
		// 		return;
		// 	}
		// 	// right-arrow
		// 	if (event.which == 39) {
		// 		event.preventDefault();
		// 		$('.right-swipe').click();
		// 		return;
		// 	}

		// 	if (event.which == 40) {
		// 		event.preventDefault();
		// 		$('.active button.fav').click();
		// 	}
		// }
	});

	// super awesome swiping action
});

