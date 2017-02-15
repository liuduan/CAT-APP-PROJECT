$( document ).ready(function() {
	
	$('ul.nav li.dropdown').hover(function() {
		  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(200);
		}, function() {
		  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(200);
		});
	
	$(document).on('mouseenter', '.aa', function () {
        $(this).find('.aa').show();
    }).on('mouseleave', '.aa', function () {
        $(this).find('.aa').hide();
    });
	
	var $pageItem = $(".pagination li")
	$pageItem.click(function(){
        console.log($(this).html().indexOf('Next'));
        if($(this).html().indexOf('Next') <= -1 && $(this).html().indexOf('Previous') <= -1){
        $pageItem.removeClass("active");
        $(this).addClass("active");
          }
      });
	
	
	
});