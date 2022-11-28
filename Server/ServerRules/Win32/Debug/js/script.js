var slideItem = 0;
window.onload = function() {
	//setInterval(passarSlide, 2000);
	var slider = document.getElementById("slider");
	var slide = document.getElementsByClassName("slide");
	var slideWidth = slide[0].offsetWidth; 
	var sliderWidth = (slide.length * slideWidth) + 'px';
	slider.style.width = sliderWidth;

var modal = document.getElementById('myModal');
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0];
var showMenu = document.getElementById('showMenu');
var prevSlide = document.getElementById("prevSlide");
var nextSlide = document.getElementById("nextSlide");
showMenu.onclick= function(){
    var main = document.getElementById("main").style.display;
    if (main=='none' || main==''){
    	document.getElementById("main").style.display = 'block';
    } else {
    	document.getElementById("main").style.display = 'none';
    }
}

function numbers(string) 
{
    var numsStr = string.replace(/[^0-9]/g,'');
    return parseInt(numsStr);
}

function goNextSlide() {
	var currentWidth = document.getElementById("slider").style.marginLeft;
	var slider = document.getElementById("slider");
	var slideWidth = document.getElementsByClassName("slide")[0].offsetWidth;
	var maxSlides = document.getElementsByClassName("slide").length;
	var maxWidth = (maxSlides * Math.abs(slideWidth));
	if(currentWidth==''){
		currentWidth = 0;
	}
	if (currentWidth!=0){
	var nextSlide = ((numbers(currentWidth)*4) + Math.abs(slideWidth));	
    } else {
    	var nextSlide = (Math.abs(currentWidth) + (Math.abs(slideWidth)*5));
    }
    if(nextSlide>maxWidth){
    	nextSlide = 0;
    }
	var w = "-" + nextSlide + "px";
	slider.style.marginLeft = w;
}
function goPrevSlide() {
	var currentWidth = document.getElementById("slider").style.marginLeft;
	var slider = document.getElementById("slider");
	var slideWidth = document.getElementsByClassName("slide")[0].offsetWidth;
	if(currentWidth==''){
		currentWidth = 0;
	}
	if (currentWidth!=0){
	var prevSlide = (numbers(currentWidth) - (Math.abs(slideWidth)*4));	
    } else {
    	var prevSlide = ((Math.abs(currentWidth)*4) - Math.abs(slideWidth))
    }
    
	var w = "-" + prevSlide + "px";
	console.log("prevSlide:" + prevSlide);
	slider.style.marginLeft = w;
}

prevSlide.onclick = function(){
	goPrevSlide();
}
nextSlide.onclick = function(){
	goNextSlide();
}
btn.onclick = function() {
  modal.style.display = "block";
}
span.onclick = function() {
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

}

