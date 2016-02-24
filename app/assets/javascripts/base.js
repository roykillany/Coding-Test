var closeModal = function(el) {
		var modal = $(el).parent().parent();
		modal.addClass("hidden");
};

var _modalHandler = function(e) {
	if(e.target != this) {
		return;
	}
	$(this).addClass("hidden");
	$(this).unbind("click");
};