function addBurgerListeners() {
  burger = document.getElementById('main-burger')
  menu = document.getElementById('main-navbar')
  burger.addEventListener('click', () => {
    burger.classList.toggle('is-active')
    menu.classList.toggle('is-active')
  })
}

document.addEventListener('turbolinks:load', addBurgerListeners)
document.addEventListener('DOMContentLoaded', addBurgerListeners)