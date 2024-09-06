
document.addEventListener('turbo:load', function(){
  let controls = document.querySelectorAll('.form-inline-link')

  for (let control of controls) {
    control.addEventListener('click', formInlineLinkHandler)
  }

  let errors = document.querySelector('.resource-errors')

  if (errors) {
    let resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

export function formInlineLinkHandler(event) {
  event.preventDefault(true)
  formInlineHandler(this.dataset.testId)
}

export function formInlineHandler(testId) {
  let form  = document.querySelector(`.form-inline[data-test-id="${testId}"]`)
  if (!form) return;

  let link  = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
  let title = document.querySelector(`.test-title[data-test-id="${testId}"]`)

  const caption = new Map([[true, 'Отмена'], [false, 'Править']])
  link.textContent = caption.get(form.classList.contains('hide'))

  title.classList.toggle('hide')
  form.classList.toggle('hide')
}
