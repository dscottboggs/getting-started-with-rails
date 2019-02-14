function addDeleteListener(msg) {
  msg.querySelector('.delete').addEventListener('mouseup', event => {
    setTimeout(() => {
      msg.removeChild(event.target)
      msg.parentElement.removeChild(msg)
    }, 1000)
    msg.style.opacity = "0"
  })
}

document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.flash-message').forEach(addDeleteListener)
})