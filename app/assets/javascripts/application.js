// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require highcharts
//= require foundation
//= require_tree .

$(window).on('load', function () {
  $(document).foundation();
  $('.alert-box').closest('[data-alert]').fadeOut(3500);
  $("[href]").each(function() {
  if (this.href == window.location.href) {
      $(this).addClass("active");
      }
  });
  // set option
    var speed = 500;				// fade speed
    var autoswitch = false;			// auto slider option
    var autoswitch_speed = 4000;	// aut slider speed

    // add initial active class
    $('.slide').first().addClass('active');

    // hide all slides
    $('.slide').hide();

    // show first slide
    $('.active').fadeIn();

    // Next slide handler
    $('#next').on('click', nextSlide);

    // Prev slide handler
    $('#prev').on('click', prevSlide);

    // Set auto rotate
    if(autoswitch === true) {
        var slideIntv = setInterval( nextSlide, autoswitch_speed);

        // pause on hover
        $("#slider").mouseenter( function() {
            clearInterval(slideIntv);
        });
        // start again
        $("#slider").mouseleave( function() {
            slideIntv = setInterval( nextSlide, autoswitch_speed);
        });
    }



    // switch to the next slide
    function nextSlide() {
        // remove active class
        $('.active').removeClass('active').addClass('oldActive');

        // check to see if we're on the last image
        if ( $('.oldActive').is(':last-child')) {
            $('.slide').first().addClass('active');
        } else {
            $('.oldActive').next().addClass('active');
        }

        $('.oldActive').removeClass('oldActive');
        $('.slide').fadeOut(speed);
        $('.active').fadeIn(speed);
    }

    // switch to the previous slide
    function prevSlide() {
        // remove active class
        $('.active').removeClass('active').addClass('oldActive');

        // check to see if we're on the fist image
        if ( $('.oldActive').is(':first-child')) {
            $('.slide').last().addClass('active');
        } else {
            $('.oldActive').prev().addClass('active');
        }

        $('.oldActive').removeClass('oldActive');
        $('.slide').fadeOut(speed);
        $('.active').fadeIn(speed);
    }
});

$(function () {
   $('#products').data('url');
});


$(document).ready(function() {

});
