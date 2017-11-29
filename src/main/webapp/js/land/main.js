jQuery(document).on('ready', function ($) {
    "use strict";

    /*--------------------------
        SCROLLSPY ACTIVE
    ---------------------------*/
    $('body').scrollspy({
        target: '.bs-example-js-navbar-scrollspy',
        offset: 65
    });


    /*--------------------------
        STICKY MAINMENU
    ---------------------------*/
    $("#mainmenu-area").sticky({
        topSpacing: 0
    });


    /*---------------------------
        SMOOTH SCROLL
    -----------------------------*/
    $('ul#nav li a[href^="#"],a.navbar-brand,.slider-area h3 a,a.scrolltotop,.home-slider-button a').on('click', function (event) {
        var id = $(this).attr("href");
        var offset = 40;
        var target = $(id).offset().top - offset;
        $('html, body').animate({
            scrollTop: target
        }, 1500, "easeInOutExpo");
        event.preventDefault();
    });


    /*----------------------------
        SCROLL TO TOP
    ------------------------------*/
    $(window).scroll(function () {
        var totalHeight = $(window).scrollTop();
        if (totalHeight > 300) {
            $(".scrolltotop").fadeIn();
        } else {
            $(".scrolltotop").fadeOut();
        }
    });


    /*---------------------------
        SCREENSHOT SLIDER
    -----------------------------*/
    $('.client-slider').owlCarousel({
        merge: true,
        smartSpeed: 1000,
        loop: true,
        nav: false,
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        autoplay: false,
        autoplayTimeout: 2000,
        margin: 10,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 3
            },
            1000: {
                items: 6
            }
        }
    });


    /*--------------------------
        SCREENSHOT SLIDER
    ---------------------------*/

    $('.responsiveGallery-wrapper').responsiveGallery({
        animatDuration: 400,
        $btn_prev: $('.responsiveGallery-btn_prev'),
        $btn_next: $('.responsiveGallery-btn_next')
    });


    /*---------------------------
        TESTMONIAL SLIDER
    -----------------------------*/
    $('.testmonial-slider').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: true,
        fade: true,
        appendArrows: '.testmonial-arrow',
        asNavFor: '.testmonial-img-slider'
    });
    $('.testmonial-img-slider').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.testmonial-slider',
        dots: true,
        centerMode: true,
        focusOnSelect: true
    });


    /*---------------------------
        MICHIMP INTEGRATION
    -----------------------------*/

    $('#mc-form').ajaxChimp({
        url: 'http://intimissibd.us14.list-manage.com/subscribe/post?u=a77a312486b6e42518623c58a&amp;id=4af1f9af4c', //Set Your Mailchamp URL
        callback: function (resp) {
            if (resp.result === 'success') {
                $('.subscriber-form input, .subscriber-form button').hide();
            }
        }
    });


    /*----------------------------
        PRICE TABLE ACTIVE
    -----------------------------*/
    $('.single-price').on('hover', function (e) {
        $('.single-price').removeClass('active');
        var $this = $(this);
        if (!$this.hasClass('active')) {
            $this.addClass('active');
        }
        e.preventDefault();

    });


    /*----------------------------
        VIDEO AREA PLAY PAUSE BUTTON
    ------------------------------*/
    var vid = document.getElementById("bgvid");
    var pauseButton = document.querySelector(".video-area button");

    vid.addEventListener('ended', function () {
        // only functional if "loop" is removed 
        vid.pause();
        // to capture IE10
        vidFade();
    });

    pauseButton.addEventListener("click", function () {
        if (vid.paused) {
            vid.play();
            pauseButton.innerHTML = "<i class='fa fa-pause'> </i>";
            $(".video-area").addClass("palying");
        } else {
            vid.pause();
            pauseButton.innerHTML = "<i class='fa fa-play'></i>";
            $(".video-area").removeClass("palying");
        }
    });


    /*--------------------------
        ACTIVE WOW JS
    ----------------------------*/
    new WOW().init();

}(jQuery));



jQuery(window).on('load', function () {
    "use strict";
    /*--------------------------
        PRE LOADER
    ----------------------------*/
    $(".preeloader").fadeOut(1000);
});