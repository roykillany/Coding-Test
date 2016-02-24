var menuToggle = function(){
	var icon = $(".menuicon");
	var menu = $(".dropdown");
	if(menu.hasClass("active")) {
		icon.removeClass("clicked");
		menu.removeClass("active");
	} else {
		icon.addClass("clicked");
		menu.addClass("active");
	}
};