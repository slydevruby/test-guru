
document.addEventListener("turbo:load", function() {
  let confirmation = document.getElementById('user_password_confirmation')
  if (confirmation)  {
    confirmation.addEventListener('input', check_confirmation, false)
  }
 }, false)

function check_confirmation(event){
  event.preventDefault();

  let password = document.getElementById('user_password')
  let confirm_ok = document.querySelector('.octicon-shield-check')
  let confirm_fail  = document.querySelector('.octicon-shield')
  if (event.target.value == 0) {
    confirm_ok.classList.add('hide')
    confirm_fail.classList.add('hide')
    return
  }

  if (event.target.value == password.value) {
    confirm_ok.classList.toggle('hide', false)
    confirm_fail.classList.toggle('hide', true)
  } else {
    confirm_ok.classList.toggle('hide', true)
    confirm_fail.classList.toggle('hide', false)
  }
}
