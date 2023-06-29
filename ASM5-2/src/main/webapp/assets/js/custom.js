jQuery(document).ready(function($) {


	"use strict";



	$(function() {
		$("#tabs").tabs();
	});


	// Page loading animation

	$("#preloader").animate({
		'opacity': '0'
	}, 600, function() {
		setTimeout(function() {
			$("#preloader").css("visibility", "hidden").fadeOut();
		}, 300);
	});


	$(window).scroll(function() {
		var scroll = $(window).scrollTop();
		var box = $('.header-text').height();
		var header = $('header').height();

		if (scroll >= box - header) {
			$("header").addClass("background-header");
		} else {
			$("header").removeClass("background-header");
		}
	});
	if ($('.owl-clients').length) {
		$('.owl-clients').owlCarousel({
			loop: true,
			nav: false,
			dots: true,
			items: 1,
			margin: 30,
			autoplay: false,
			smartSpeed: 700,
			autoplayTimeout: 6000,
			responsive: {
				0: {
					items: 1,
					margin: 0
				},
				460: {
					items: 1,
					margin: 0
				},
				576: {
					items: 3,
					margin: 20
				},
				992: {
					items: 5,
					margin: 30
				}
			}
		});
	}
	if ($('.owl-testimonials').length) {
		$('.owl-testimonials').owlCarousel({
			loop: true,
			nav: false,
			dots: true,
			items: 1,
			margin: 30,
			autoplay: false,
			smartSpeed: 700,
			autoplayTimeout: 6000,
			responsive: {
				0: {
					items: 1,
					margin: 0
				},
				460: {
					items: 1,
					margin: 0
				},
				576: {
					items: 2,
					margin: 20
				},
				992: {
					items: 2,
					margin: 30
				}
			}
		});
	}
	if ($('.owl-banner').length) {
		$('.owl-banner').owlCarousel({
			loop: true,
			nav: false,
			dots: true,
			items: 1,
			margin: 0,
			autoplay: false,
			smartSpeed: 700,
			autoplayTimeout: 6000,
			responsive: {
				0: {
					items: 1,
					margin: 0
				},
				460: {
					items: 1,
					margin: 0
				},
				576: {
					items: 1,
					margin: 20
				},
				992: {
					items: 1,
					margin: 30
				}
			}
		});
	}

	$(".Modern-Slider").slick({
		autoplay: true,
		autoplaySpeed: 10000,
		speed: 600,
		slidesToShow: 1,
		slidesToScroll: 1,
		pauseOnHover: false,
		dots: true,
		pauseOnDotsHover: true,
		cssEase: 'linear',
		// fade:true,
		draggable: false,
		prevArrow: '<button class="PrevArrow"></button>',
		nextArrow: '<button class="NextArrow"></button>',
	});

	$('.filters ul li').click(function() {
		$('.filters ul li').removeClass('active');
		$(this).addClass('active');

		var data = $(this).attr('data-filter');
		$grid.isotope({
			filter: data
		})
	});

	var $grid = $(".grid").isotope({
		itemSelector: ".all",
		percentPosition: true,
		masonry: {
			columnWidth: ".all"
		}
	})
	$('.accordion > li:eq(0) a').addClass('active').next().slideDown();

	$('.accordion a').click(function(j) {
		var dropDown = $(this).closest('li').find('.content');

		$(this).closest('.accordion').find('.content').not(dropDown).slideUp();

		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
		} else {
			$(this).closest('.accordion').find('a.active').removeClass('active');
			$(this).addClass('active');
		}

		dropDown.stop(false, true).slideToggle();

		j.preventDefault();
	});

	/*-------------------
 Range Slider
--------------------- */
	var rangeSlider = $(".price-range"),
		minamount = $("#minamount"),
		maxamount = $("#maxamount"),
		minPrice = rangeSlider.data('min'),
		maxPrice = rangeSlider.data('max');
	rangeSlider.slider({
		range: true,
		min: minPrice,
		max: maxPrice,
		values: [minPrice, maxPrice],
		slide: function(event, ui) {
			minamount.val(ui.values[0]);
			maxamount.val(ui.values[1]);
		}
	});
	minamount.val(rangeSlider.slider("values", 0));
	maxamount.val(rangeSlider.slider("values", 1));




    /*------------------
        Product Slider
    --------------------*/
   $(".product-slider").owlCarousel({
        loop: true,
        margin: 25,
        nav: true,
        items: 4,
        dots: true,
        navText: ['<i class="ti-angle-left"></i>', '<i class="ti-angle-right"></i>'],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 2,
            },
            992: {
                items: 2,
            },
            1200: {
                items: 3,
            }
        }
    });

   /*-------------------
		Radio Btn
	--------------------- */
    $(".fw-size-choose .sc-item label, .pd-size-choose .sc-item label").on('click', function () {
        $(".fw-size-choose .sc-item label, .pd-size-choose .sc-item label").removeClass('active');
        $(this).addClass('active');
    });
    
    
    
    

  

});
