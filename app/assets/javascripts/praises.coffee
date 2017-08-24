$ ->
  $('.praise-btn').tooltipster
    content: "加载中..."
    theme: 'tooltipster-shadow'
    side: 'bottom'
    maxWidth: 230
    interactive: true
    contentAsHTML: true
    triggerClose:
      mouseleave: true

    functionBefore: (instance, helper) ->
      if $(helper.origin).data('loaded') is 1
        return
      $.ajax
        url: '/praises'
        data: 
          id: $(helper.origin).data('id')
          table: $(helper.origin).data('table')
        success: (html) ->
          instance.content(html)
          $(helper.origin).data('loaded', 1)

  $('.praise-btn').click () ->
    icon = $(this).children().first()
    if icon.hasClass('fa-thumbs-o-up')
      icon.removeClass('fa-thumbs-o-up').addClass('fa-thumbs-up')
      $.ajax
        url: '/praises'
        method: 'POST'
        data: 
          id: $(this).data('id')
          table: $(this).data('table')
    else
      icon.removeClass('fa-thumbs-up').addClass('fa-thumbs-o-up')
      $.ajax
        url: '/praises/' + $(this).data('id')
        method: 'DELETE'
        data:
          id: $(this).data('id')
          table: $(this).data('table')
    $(this).data('loaded', 0)
    $(this).children().last().addClass('praise-pending')