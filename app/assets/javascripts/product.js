var productModalToggle = function(item, event){
	if($(event.target).hasClass("fa-shopping-cart")) { return; }
	var id = $(item).data("id"),
		modal = $(".product-modal"),
		capitalizeString = function(str) {
			return str.charAt(0).toUpperCase() + str.slice(1);
		};

	$.ajax({
		url: "/products/" + id,
		type: "GET",
		success: function(resp) {
			for(var key in resp) {
				switch (key) {
					case "brand":
					case "desc":
					case "name":
						modal.find("." + key).html(resp[key]);
						break;
					case "model":
						modal.find(".name").append(" <i>" + resp[key] + "</i>");
						break;
					case "price":
						modal.find("." + key).html("$" + resp[key]);
						break;
				}
			}
			
			$(".product-modal").removeClass("hidden");
			$(".product-modal").find("input:nth-child(2)").val(resp.id);
			$(".product-modal").click(_modalHandler);
		}
	});
};