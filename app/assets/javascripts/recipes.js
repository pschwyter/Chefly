$(document).ready(function(){

	var recipeCount = 10;

	var flipCallback = function() {
		$('.recipe-flip').on('click', function(event){
			var target = $(event.target);
			var that = this;
			if(!target.is('.fav, .fav *')) {
				$('.inner').toggleClass('flipped');
				var recipeId = $(this).data("id");
				var id = {id: recipeId};
			}
		});
	}

	var callback = function(){
		var ingredient = $('#ingredient').val();
		$('#ingredient').val('');
		$('#ingredient-box').append('<div class="tag-box"><button type="button" class="ingredient-in-box tag" data-ingredient='+ ingredient +'>' + ingredient + '</button></div>');

		// need to add click-to-remove each time an ingredient is added 
		$('button.ingredient-in-box').on('click', function(){
			$(this).remove();
			// removing an ingredient makes another API call
			recipeGet();
		});

		recipeGet();
	}


	var child = 1;
	var imageCallback = function() {
		var imgRight = currentIndex +2;
		var imgLeft = currentIndex;

		recipeCount = $(".search-results").children().length;
		if (imgRight > recipeCount) { imgRight = 1; }
		if (imgLeft < 1) { imgLeft = recipeCount; }

		var imageUrlRight = $(".search-results .recipe-thumb:nth-child(" + imgRight + ") .inner img").attr('src');
		$('.right-swipe').css('background-image', 'url(' + imageUrlRight + ')');

		var imageUrlLeft = $(".search-results .recipe-thumb:nth-child(" + imgLeft + ") .inner img").attr('src');
		$('.left-swipe').css('background-image', 'url(' + imageUrlLeft + ')');
	}

	var recipeGet = function() {
		var ingredients = $('#ingredient-box div').map(function(index, div){return $(div).text()});
		var ingredients_array = [];

		ingredients.each(function(index,value){ingredients_array.push(value)});
		ingredients_string = ingredients_array.join(',');
	    // var valuesToSubmit = {ingredients: string_ingredients};
	    var valuesToSubmit = {ingredients: ingredients_string};
	    console.log(valuesToSubmit);

	    $.ajax({
	    	type: "GET",
	        // url: "/recipes", //sumbits it to the given url of the form
	        data: valuesToSubmit,
	        dataType: "SCRIPT", // you want a difference between normal and ajax-calls, and json is standard
	        beforeSend:function(){
	        	$(".search-results, .swipe").hide();
	        },
	    	fail:function(){
	    		console.log('fail');
	    	},
	    	success:function(){
		    	$(".search-results, .swipe").show();
		    	recipeCount = $('.search-results > div').length;
		    	console.log('success, recipe count: ' + recipeCount);
		    	var currentIndex = 0;
		    	/* add the active class to the first item to hide all the others */
		    	$('.search-results > div:eq(' + currentIndex + ')').addClass('active');
		    	imageCallback();
		    	flipCallback();
		    	// adds textfill to first result
		    	$('.title').textfill({ maxFontPixels: 200 });

			    var $firstRecipe 	= $('.active'),
				    	recipeId 			= $firstRecipe.data("id"),
					  	id 						= {id: recipeId};

		    	$.ajax({
						type: "GET",
				    url: '/show_recipe', //submits it to the given url of the form
				    data: id,
				    dataType: "SCRIPT" // you want a difference between normal and ajax-calls, and json is standard
					}).success(function(){
						$('.recipe-name', $firstRecipe).textfill({ maxFontPixels: 200 });
				});
			}
	    });
	}

	recipeGet();

	$('#ingredient').keypress(function(event){
		if (event.which == 13) {
			callback();
		}       
	});

	$("#add-ingredient").on('click', callback);

	//Add hover class to recipe thumb when hovering over buttons

	$(".right-swipe").hover(
		function() {
			$(".recipe-thumb").addClass( "hover" );
		}, function() {
			$(".recipe-thumb").removeClass( "hover" );
		}
		);

	$(".left-swipe").hover(
		function() {
			$(".recipe-thumb").addClass( "hover2" );
		}, function() {
			$(".recipe-thumb").removeClass( "hover2" );
		}
		);

	// Transition out recipe result on clicking next
	var currentIndex = 0;


	// hot-keys!

	$(document).keydown(function(event){

		if (($('#ingredient').is(':focus') == false) || $('#ingredient').val() == "" ) {

			// up-arrow
			if (event.which == 38) {
				$('.recipe-thumb.active').click();
				return;
			}
			// left-arrow
			if (event.which == 37) {
				event.preventDefault();
				$('.left-swipe').click();
				return;
			}
			// right-arrow
			if (event.which == 39) {
				event.preventDefault();
				$('.right-swipe').click();
				return;
			}
		}
	});

	// $('.active .fav').click(function(event){
	// 	$('.recipe-flip').removeClass('recipe-flip');
	// });
	
	// super awesome swiping action
	$('.swipe').on('click', function() {

		$('.inner').removeClass('flipped');
		var $active = $('.search-results > div.active'),
				$isNext  = $(this).hasClass('right-swipe');
		
		currentIndex = ((currentIndex + ($isNext ? 1 : -1)) % recipeCount);


    // go back to the last item if we hit -1 
    if (currentIndex === -1) {
    	currentIndex = recipeCount - 1;
    }

     var $next 		= $('.search-results > div:eq(' + currentIndex + ')'),
     		 recipeId = $next.data("id"),
				 id 			= {id: recipeId};

     $active.addClass($isNext ? 'next-out' : 'prev-out');
     $next.addClass('active').addClass($isNext ? 'next-in' : 'prev-in');
     var textfillTargetChild = currentIndex + 1;
     $('.recipe-thumb:nth-child('+textfillTargetChild+') .title').textfill({ maxFontPixels: 200 });

     $.ajax({
				type: "GET",
		    url: '/show_recipe', //submits it to the given url of the form
		    data: id,
		    dataType: "SCRIPT" // you want a difference between normal and ajax-calls, and json is standard
			}).success(function(){
				$('.recipe-name', $next).textfill({ maxFontPixels: 200 });
			});

     imageCallback();
     
     setTimeout(function() { 
     	$active.removeClass('active next-out prev-out');
     	$next.removeClass('next-in prev-in');
     }, 500);
     return false;
 });

});










