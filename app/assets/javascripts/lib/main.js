var $ = jQuery;
/* -------- owl carousel ------------ */
$(document).ready(function() {
	$('.owl-carousel.owl-industry').owlCarousel({
		loop: true,
		margin: 10,
		responsiveClass: true,
		responsive: {
			0: {
				items: 1,
				nav: true
			},
			600: {
				items: 1,
				nav: false
			},
			1000: {
				// autoplay: true,
				items: 6,
				nav: true,
				loop: false,
				margin: 20
			}
		}
	});
	$('.owl-carousel.owl-hot').owlCarousel({
		loop: true,
		margin: 10,
		responsiveClass: true,
		responsive: {
			0: {
				items: 1,
				nav: true
			},
			600: {
				items: 1,
				nav: false
			},
			1000: {
				// autoplay: true,
				items: 8,
				nav: true,
				loop: false,
				margin: 20
			}
		}
	})
});