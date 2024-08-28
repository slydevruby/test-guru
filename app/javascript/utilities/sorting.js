document.addEventListener("turbo:load", function() {
  let control = document.querySelector('.sort-by-title')
  if (control) control.addEventListener('click', sortRowsByTitle)
 })

function compareRowsAsc(row1, row2) {
  let title1 = row1.querySelector('td').textContent
  let title2 = row2.querySelector('td').textContent
  if (title1 < title2) { return -1 }
  if (title1 > title2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  let title1 = row1.querySelector('td').textContent
  let title2 = row2.querySelector('td').textContent
  if (title1 < title2) { return 1 }
  if (title1 > title2) { return -1 }
  return 0
}

function sortRowsByTitle() {
  let table = document.querySelector('table')
  let rows = table.tBodies[0].rows
  let sortedRows = []

  for (let i = 0; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

   let tbody = document.createElement('tbody');
   for (let i = 0; i < sortedRows.length; i++) {
    tbody.appendChild(sortedRows[i])
   }
  table.tBodies[0].replaceWith(tbody)
}
