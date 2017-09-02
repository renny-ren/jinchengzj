$ ->  
  $('.follow-btn').click () ->
    username = $(this).data('username')
    icon = $(this).children().first()
    if icon.hasClass('fa-user-o')
      $.ajax
        url: "/#{username}/follow"
        method: 'POST'     
    else
      $.ajax
        url: "/#{username}/unfollow"
        method: 'DELETE'
        