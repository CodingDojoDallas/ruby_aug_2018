
// Nav-Shrink
$(document).ready(function() {
    $(window).scroll(function() {
    if($(document).scrollTop() > 10) {
        $('nav').addClass('shrink');
    }
    else {
        $('nav').removeClass('shrink');
        }
    });
});


// // ???
// document.addEventListener('DOMContentLoaded', function() {
//     var elems = document.querySelectorAll('.scrollspy');
//     var instances = M.ScrollSpy.init(elems, options);
// });

// // Or with jQuery

// $(document).ready(function(){
//     $('.scrollspy').scrollSpy();
// });
