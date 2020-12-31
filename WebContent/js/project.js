$(document).ready(function(){
	$(".btn-add-to-cart").click(function(){
		var id = $(this).closest("div").attr("data-id");
		alert("You click me " + id)
		$.ajax({
			url:"/cart/add/"+id+".htm",
			success:function(response){
				alert(response)
			}
		})
	});
});