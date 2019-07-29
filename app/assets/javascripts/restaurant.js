// $(document).ready(function(){
$(window).on('load', function (e) {
	$('[data-toggle="tooltip"]').tooltip();
	console.log("lol");
	// Append table with add row form on add new button click
    $(".add-new").on('click', function(){
			console.log("click");
			$("#add-food-list").removeAttr("hidden");
			if ($("#add-food-list .new-food-element").length >= 1)
				$(this).attr("disabled", "disabled");
		});
});

$(document).ready(function() {
  $(".delete").hide();
  //when the Add Field button is clicked
  $(document).on('click', ".add-more",function(e) {
		$(".delete").fadeIn("1500");
    //Append a new row of code to the "#items" div
    $(this).parent().find(".items").append(
      '<div class="next-referral col-6"><input id="textinput" name="textinput" type="text" placeholder="Enter image_url" class="form-control input-md"></div>'
    );
  });
  $("body").on("click", ".delete", function(e) {
    $(".next-referral").last().remove();
  });
});
