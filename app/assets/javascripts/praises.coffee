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
        data: id: $(helper.origin).data('id')
        success: (html) ->
          instance.content(html)
          $(helper.origin).data('loaded', 1)
