// Configurações dos sliders 
$(document).ready(function(){
  $('.slider-container').slick({
    slidesToShow: 6,
    slidesToScroll: 3,
    arrows: true,
    centerMode: false,
    responsive: [
      {
        breakpoint: 1440,
        settings: {
          slidesToShow: 5,
          slidesToScroll: 2,
          centerMode: false,
        }
      },
      {
        breakpoint: 960,
        settings: {
          arrows: false,
          slidesToShow: 3,
          slidesToScroll: 1,
          centerMode: false,
        }
      },
      {
        breakpoint: 480,
        settings: {
          arrows: false,
          slidesToShow: 2,
          slidesToScroll: 2,
          centerMode: false,
        }
      }
    ]
  });
});

var allBtn = Array.from(document.querySelectorAll('.btn-see-more'));
var allCovers = Array.from(document.querySelectorAll('.course-cover'));

function showPreview(content) {
  let allCollapses = Array.from(document.querySelectorAll('.course-collapse'))
  let currentCollapse = document.getElementById(content.collapseId)
  let video = content.video
  let iframe = `<div class="embed-responsive embed-responsive-16by9 video-collapse "><iframe src="${video}" width="600" height="320" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe></div>`
  let btn = content.el
  let currentCover = btn.parentElement.parentElement

  if(currentCover.classList.contains('active')) {
    console.log('dimiss current', currentCover, btn)
    allCovers.forEach(function(cover) {
      if (cover.classList.contains('active')) {
        cover.classList.remove('active')
      }
    });
    return currentCollapse.classList.remove('show')
  }

  currentCollapse.innerHTML += iframe

  allCovers.forEach(function(cover) {
    if (cover.classList.contains('active')) {
      cover.classList.remove('active')
    }
  });
  
  if(!currentCover.classList.contains('active')) {
    currentCover.classList.add('active')
  }

  allCollapses.forEach(function(collapse) {
    if (collapse.classList.contains('show') && collapse !== currentCollapse) {
      closeCollapse(collapse)
      collapse.classList.remove('show')
    }
  });

  if (!currentCollapse.classList.contains('show')) {
      currentCollapse.classList.add('show')
  }
}

function closeCollapse(el) {
  let activeCollapse = el.parentElement
  if (activeCollapse.classList.contains('show')) {
    activeCollapse.classList.remove('show')
  }

  allCovers.forEach(function(cover) {
    if (cover.classList.contains('active')) {
      cover.classList.remove('active')
    }
  });
}
