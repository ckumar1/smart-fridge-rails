$(document).ready(function() {

	var container = $('.header-content');
	
	//load home on start
    container.load('login.html');
    
    //for every navbar item that is not a drop down, load the correct page under 
    //the 
	$('.navbar-nav').find('a').not($('.dropdown-toggle')).on('click', function(e) {
		 event.preventDefault();
		 var $href = $(this).attr('href');
		 
		 container.load($href);
		 
		 $('.navbar-nav li').removeClass('active');
		 $(this).parent().addClass('active');
		 
		 //initContainerHeight();
	});
	
});

function initContainerHeight() {

	var container = $('.header-content');
	
	/* Get New Values */
	var main = $('.main').height(),
		sidebar = $('.sidebar').height();
	
	/* Set New Values */
	(main > sidebar) ? container.height(main) : container.height(sidebar);		
	
	console.log(main);
}