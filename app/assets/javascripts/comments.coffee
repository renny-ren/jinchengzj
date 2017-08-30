# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  deg = 0
  $('.comment-btn').click () ->
    id = $(this).data('id')
    $(".comment-container[data-id="+id+"]").slideToggle('fast')
    deg = (deg + 180) % 360
    $('.arrow').css('transform', 'rotate(' + deg + 'deg)')