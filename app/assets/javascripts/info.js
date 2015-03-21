$(document).ready(function(){

	$('.info').on('click', function(){
		$('.info-overlay').toggleClass('info-activated');
	});

	$('.info-overlay').on('click', function(){
		$('.info-overlay').removeClass('info-activated');
	});
});