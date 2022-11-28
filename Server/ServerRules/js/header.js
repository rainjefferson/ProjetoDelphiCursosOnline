$(document).ready(function(){
	
	header_top_menu = header_user_submenu = 0;
	
	$(".header .menu-align .menu-icone").click(function(){
		if(header_top_menu == 0){
			$(this).parent().find(".menu").show();
			header_top_menu = 1;
		}else{
			$(this).parent().find(".menu").hide();
			header_top_menu = 0;
		}
	});
	
	$(".header .user-menu-align .user-menu #show-user-menu").click(function(){
		if(header_user_submenu == 0){
			$(this).parent().find("#user-profile-submenu").show();
			header_user_submenu = 1;
		}else{
			$(this).parent().find("#user-profile-submenu").hide();
			header_user_submenu = 0;
		}
	});
	
	$(document).scroll(function() {
		if($(document).scrollTop() == 0){
			navibarFixed(0);
		}else{
			navibarFixed(1);
		}
	});
	
	function navibarFixed(i){
		if(i == 1){
			$(".header").addClass("header-scroll");
			$(".page-section").css("padding", "60px 0px 0px 0px");
		}else{
			$(".header").removeClass("header-scroll");
			$(".page-section").css("padding", "0px 0px 0px 0px");
		}
	}
	
	
	
});