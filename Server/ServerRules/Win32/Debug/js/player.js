var allBtn = Array.from(document.querySelectorAll('.btn-less-more'));

console.log(allBtn)

allBtn.forEach(function(button) {
    button.addEventListener('click', function(){
      console.log(button)
      button.classList.toggle('open')
    })
});

function toggleSidebar() {
  const sidebar = document.getElementById('sidebar-el')
  const player = document.getElementById('player-col')
  const toggleBtn = document.getElementById('toggle-sidebar-btn')

  sidebar.classList.toggle('closed')
  toggleBtn.classList.toggle('fixed')

  if (player.classList.contains('full-width')) {
      player.classList.add('col-md-9')
      player.classList.remove('offset-md-1')
      player.classList.remove('col-md-10')
    } else {
      player.classList.remove('col-md-9')
      player.classList.add('offset-md-1')
      player.classList.add('col-md-10')
  }
}