$(document).ready(function () {

    //let btns = $('.my-gallery .button-group button');

    //btns.click(function (e) {
    //    $('.my-gallery .button-group button').removeClass('active');
    //    e.target.classList.add('active');

    //    let selector = $(e.target).attr('data-filter');
    //    $('.my-gallery .grid').isotope({
    //        filter: selector
    //    });

    //    return false;
    //});

    //$('.my-gallery .button-group #btn1').trigger('click');


    $('.my-gallery .grid .test-popup-link').magnificPopup({
        type: 'image',
        gallery: { enabled: true }
    });

});