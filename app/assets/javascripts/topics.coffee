# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.node_name a').click (e) ->
    e.preventDefault()
    $("#node-selector").modal('hide')
    $('#node-selector-button').html($(this).text())
    $('#topic_node_id').val($(this).data('id'))

  $(document).on 'click', '#flash_notice', ->
    $(this).hide();
