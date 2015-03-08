$(document).ready(function(){

	$('.favourite-title').textfill({ maxFontPixels: 200 });

	$('.favourite-recipe').click(function(){
		$(this).toggleClass('flipped');
	});

});