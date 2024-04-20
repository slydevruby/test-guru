document.addEventListener('turbo:load', function(){
  let progressBar = document.querySelector('.progress-bar')
  if (progressBar) {
    let no = progressBar.dataset.questionNo
    let total = progressBar.dataset.questionTotal
    let width = Math.round(100 * no / total)
    progressBar.style = `width: ${width}` + '%'

    let wrapper = document.querySelector('.progress-bar')
    wrapper.ariaValueNow = width
  }
})
