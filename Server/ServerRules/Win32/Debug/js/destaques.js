$(document).ready(function(){
	destaques_select_count = 1;
	$("#destaques-lista .prox").click(function(){
		$("#destaques-lista .lista-align").css("background", "none");
		if(destaques_select_count < 8){
			var x = $("#destaques-item-"+destaques_select_count); 
			$(".lista-items").scrollLeft(x.position().left); 
			x.css("background", "rgba(28, 76, 102)");
			destaques_select_count++; 
		}
	});
	
	$("#destaques-lista .ant").click(function(){
		$("#destaques-lista .lista-align").css("background", "none");
		if(destaques_select_count > 2){
			var x = $("#destaques-item-"+destaques_select_count); 
			$(".lista-items").scrollLeft(x.position().left); 
			x.css("background", "rgba(28, 76, 102)");
			destaques_select_count--; 
		}
	});
	
	/*$("#destaques-lista .prox").click = function() {
		if(destaques_select_count < 10){
			alert(destaques_select_count);
			destaques_select_count++;
 			 $(document).scrollTo('#1');
		}
    }*/
});