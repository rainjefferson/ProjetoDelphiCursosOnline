$(document).ready(function(){
	
	var show_playlist = 0;
	
	$(".playlist-align #show-playlist").click(function(){
		if(show_playlist == 0){
			$(this).find(".i-show").addClass("i-show-rotate");
			$(this).parent().parent().parent().find(".playlist-videos").show();
			$(this).parent().parent().parent().addClass("playlist-align-show");
			show_playlist = 1;
		}else{
			$(this).find(".i-show").removeClass("i-show-rotate");
			$(this).parent().parent().parent().find(".playlist-videos").hide();
			$(this).parent().parent().parent().removeClass("playlist-align-show");
			show_playlist = 0;
		}
	});
});