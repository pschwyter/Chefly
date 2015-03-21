$(document).ready(function(){

	$('.info').on('click', function(){
		$('.info-overlay').toggleClass('info-activated');
		$('.info-container').toggleClass('info-con-activated');
	});
});