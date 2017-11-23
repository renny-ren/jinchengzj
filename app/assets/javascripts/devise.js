$(document).ajaxError(function (e, xhr, settings) {
    if (xhr.status == 401) {
      window.location.replace('/users/sign_in');
      $('.flash-notice').text(xhr.responseText);
      $('.flash-notice').fadeIn().delay(2000).fadeOut();
    }
});
