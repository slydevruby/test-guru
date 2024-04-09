
document.addEventListener('turbo:load', function() {
  let control = document.querySelector('.sort-by-title')
  control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle() {
  let table = document.querySelector('table')
  let rows = table.querySelectorAll('tr')
  console.log(rows)
}
