# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'DOMContentLoaded', ->
  burger = document.getElementById 'main-burger'
  menu = document.getElementById 'main-navbar'
  console.error "burger not found #{burger}" unless burger?
  console.error "menu not found #{menu}" unless menu?
  burger.addEventListener 'click', ->
    burger.classList.toggle 'is-active'
    menu.classList.toggle 'is-active'
