
jQuery(document).ready(function( $ ) {

    // subscribe:
    $("#buttonSubscribe").click(function(){
        var vemail = $("#email").val();
        if(vemail=='')
        {
            alert("Please fill out the form");
        }
        else if(vemail==''){alert('Email field is required')}
        else{
            $.get("php/email.php", { email:vemail },
                function(response, status){
                    $("#email").val('');
                    alert(response+"\n\nStatus : " + status);
                });
        }
    });

    $('#myCarousel').carousel({
        interval: 5000
    })
    $('.fdi-Carousel .item').each(function () {
        var next = $(this).next();
        if (!next.length) {
            next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));

        if (next.next().length > 0) {
            next.next().children(':first-child').clone().appendTo($(this));
        }
        else {
            $(this).siblings(':first').children(':first-child').clone().appendTo($(this));
        }
    });

    // navbar:
    $('.navbar-nav [data-toggle="tooltip"]').tooltip();
    $('.navbar-twitch-toggle').on('click', function(event) {
        event.preventDefault();
        $('.navbar-twitch').toggleClass('open');
    });

    $('.nav-style-toggle').on('click', function(event) {
        event.preventDefault();
        var $current = $('.nav-style-toggle.disabled');
        $(this).addClass('disabled');
        $current.removeClass('disabled');
        $('.navbar-twitch').removeClass('navbar-'+$current.data('type'));
        $('.navbar-twitch').addClass('navbar-'+$(this).data('type'));
    });

    // contact
    $("#buttonContact").click(function(){
        var vname = $("#InputName").val();
        var vemail = $("#InputEmail").val();
        var vmessage = $("#InputMessage").val();
        if(vname=='' || vemail=='' || vmessage=='')
        {
            alert("Please fill out the form");
        }
        else{
            $.get("php/contact.php", { name:vname,email:vemail,message:vmessage },
                function(response, status){
                    $("#InputName").val('');
                    $("#InputEmail").val('');
                    $("#InputMessage").val('');
                    alert(response+"\n\nStatus : " + status);
                });
        }
    });

    // preloader
    $('#status').fadeOut(); // will first fade out the loading animation
    $('#preloader').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
    $('body').delay(350).css({'overflow':'visible'});

    // counterUp
    $('span').counterUp({
        delay: 10, // the delay time in ms
        time: 1000 // the speed time in ms
    });

    // ScrollReveal
    window.sr = new scrollReveal();

    // cache the window object
    $window = $(window);

    $('section[data-type="background"]').each(function(){
// declare the variable to affect the defined data-type
        var $scroll = $(this);

        $(window).scroll(function() {
// HTML5 proves useful for helping with creating JS functions!
// also, negative value because we're scrolling upwards
            var yPos = -($window.scrollTop() / $scroll.data('speed'));

// background position
            var coords = '50% '+ yPos + 'px';

// move the background
            $scroll.css({ backgroundPosition: coords });
        }); // end window scroll
    });  // end section function
});




