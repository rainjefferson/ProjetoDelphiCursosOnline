//Abrir e fechar menu avatar
var menuAvatar = document.getElementById('menu-avatar')
var btnMenuAvatar = document.getElementById('btn-open-menu-avatar')
var btnAvatarImage = document.getElementById('btn-avatar-image')

document.addEventListener('click', function(e) {
  if (e.target !== btnAvatarImage && e.target !== btnMenuAvatar) {
    menuAvatar.classList.remove('show')
  }
})

btnMenuAvatar.addEventListener('click', function() {
  menuAvatar.classList.toggle('show')
})

// Menu lateral e mobile
var slideout = new Slideout({
  'panel': document.getElementById('panel'),
  'menu': document.getElementById('menu'),
  'padding': 256,
  'tolerance': 70
});

//Abrir e fechar barra de buscar mobile
function toggleSearchBar() {

  var searchBar = document.getElementById('search-bar')
  var searchBtn = document.getElementById('btn-close-search')
  var searchCloseBtn = document.getElementById('btn-search')

  searchBar.classList.toggle('active')
  searchBtn.classList.toggle('show')
  searchCloseBtn.classList.toggle('show')
}

// Botão para abrir e fechar menu lateral
document.querySelector('.toggle-menu').addEventListener('click', function () {
  slideout.toggle();
});
