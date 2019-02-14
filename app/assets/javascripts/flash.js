function addDeleteListener(msg) {
  msg.querySelector('.delete').addEventListener('mouseup', event => {
    setTimeout(() => {
      msg.removeChild(event.target)
      msg.parentElement.removeChild(msg)
    }, 1000)
    msg.style.opacity = "0"
  })
}

function flashDeleteListeners() {
  document.querySelectorAll('.flash-message').forEach(addDeleteListener)
}

document.addEventListener('DOMContentLoaded', flashDeleteListeners)

document.addEventListener('turbolinks:load', flashDeleteListeners)