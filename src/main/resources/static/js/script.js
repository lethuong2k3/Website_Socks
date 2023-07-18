$(document).ready(function() {
    $('.slider').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 3,
        prevArrow:"<button type='button' class='slick-prev pull-left'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
        nextArrow:"<button type='button' class='slick-next pull-right'><i class='fa fa-angle-right' aria-hidden='true'></i></button>"
    });
});

