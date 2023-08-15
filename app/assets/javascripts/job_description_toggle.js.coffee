# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.expand-button').on 'click', ->
    $(this).addClass('hidden')
    $(this).siblings('.full-description').addClass('hidden')
    $(this).siblings('.remaining-text').removeClass('hidden')
    $(this).siblings('.collapse-button').removeClass('hidden')

  $('.collapse-button').on 'click', ->
    $(this).addClass('hidden')
    $(this).siblings('.remaining-text').addClass('hidden')
    $(this).siblings('.full-description').removeClass('hidden')
    $(this).siblings('.expand-button').removeClass('hidden')

