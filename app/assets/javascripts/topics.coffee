# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.node_name a').click (e) ->
    e.preventDefault()
    $("#node-selector").modal('hide')
    $('#node-selector-button').html($(this).text())
    $('#topic_node_id').val($(this).data('id'))

  $('.praise-btn').click () ->
    icon = $(this).children().first()
    if icon.hasClass('fa-thumbs-o-up')
      icon.removeClass('fa-thumbs-o-up').addClass('fa-thumbs-up')
      $.ajax
        url: '/praises'
        method: 'POST'
        data: id: $(this).data('id')
    else
      icon.removeClass('fa-thumbs-up').addClass('fa-thumbs-o-up')
      $.ajax
        url: '/praises/' + $(this).data('id')
        method: 'DELETE'
    $(this).data('loaded', 0)
