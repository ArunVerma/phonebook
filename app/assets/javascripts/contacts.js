$(document).ready(function () {
	$('html').on('click', '.add-phone-row', function(event){
		var regexp, time;
		time = new Date().getTime();
		regexp = new RegExp($(this).data('id'), 'g');
		$('.phone_fields').append($(this).data('fields').replace(regexp, time));
		return event.preventDefault();
	});

	$('html').on('click', '.add-address-row', function(event){
		var regexp, time;
		time = new Date().getTime();
		regexp = new RegExp($(this).data('id'), 'g');
		$('.address_fields').append($(this).data('fields').replace(regexp, time));
		return event.preventDefault();
	});
})
