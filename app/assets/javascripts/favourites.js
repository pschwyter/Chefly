$(document).ready(function(){

	$('.favourite-title').textfill({ maxFontPixels: 200 });

	$('.favourite-recipe').click(function(){
		$(this).toggleClass('flipped');
	});

	$('.unfav-button').on('click', function() {
		var recipe_id = $(this).data('recipe-id'),
				self 			= this
				;
		$.ajax({
			method: 'DELETE',
			url: '/favourite_recipe',
			data: { favourite: {recipe_id: recipe_id} }
		}).done(function (data) {
			console.log('remove the recipe');
			$('.modal[data-recipe-id='+recipe_id+']').remove();
		});
	});

});