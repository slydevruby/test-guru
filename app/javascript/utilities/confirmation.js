
document.addEventListener("turbo:load", function() {
  let password = document.getElementById('user_password')
  let confirmation = document.getElementById('user_password_confirmation')
  if (password && confirmation)  {
    password.addEventListener('input', inputHandler, false)
    confirmation.addEventListener('input', inputHandler, false)
  }
 }, false)

function toggleImages(imageOk, imageFail, flag) {
  imageOk.classList.toggle('hide', !flag)
  imageFail.classList.toggle('hide', flag)  
}

function hideImages(imageOk, imageFail) {
  imageOk.classList.add('hide')
  imageFail.classList.add('hide')  
}

function checkConfirmation(password, confirmation) {
  let imageOk = document.querySelector('.octicon-shield-check')
  let imageFail  = document.querySelector('.octicon-shield')
  if (confirmation.value === 0 || password.value === 0) {
    hideImages(imageOk, imageFail)
    return
  }
  toggleImages(imageOk, imageFail, confirmation.value === password.value)
}

function inputHandler(event) {
  event.preventDefault();
  
  checkConfirmation(
    document.getElementById('user_password'),
    document.getElementById('user_password_confirmation')
    )
}
