(function($)
{
  
  jQuery('.cs_slideshow').jcarousel({
    scroll: 1,
    wrap: 'last'
  });
  // CASE STUDY SLIDESHOW
  
  $("#client-tabs").tabs();
  //CASE STUDY TABS


	//About Carousel
	function mycarousel_initCallback(carousel) {
    $('#about_carousel_next').bind('click', function() {
      carousel.next();
      return false;
    });
    $('#about_carousel_prev').bind('click', function() {
      carousel.prev();
      return false;
    });
  };
  function about_menu(item) {
    var parent = $(item).parent();
    $('.about_menu_items li').removeClass('selected');
    parent.addClass('selected');
  }

	jQuery('#about_carousel').jcarousel({
    scroll: 1,
		wrap: 'circular',
    initCallback: mycarousel_initCallback,
    // This tells jCarousel NOT to autobuild prev/next buttons
    buttonNextHTML: null,
    buttonPrevHTML: null
  });
  
})(jQuery);