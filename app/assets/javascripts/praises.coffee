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
      alert $(helper.origin).data('loaded')
      if $(helper.origin).data('loaded') is 1
        return
      $.ajax
        url: '/praises'
        data: id: $(helper.origin).data('id')
        success: (html) ->
          if html.length is 0
            instance.hide()
            instance.disable()
            $(helper.origin).data('loaded', 1)
          else
            instance.content(html)
            instance.enable()
            $(helper.origin).data('loaded', 1)