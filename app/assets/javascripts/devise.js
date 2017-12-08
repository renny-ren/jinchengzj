$(document).ajaxError(function (e, xhr, settings) {
  if (xhr.status == 401) {
    $('.flash-notice').text(xhr.responseText);
    $('.flash-notice').show();
    window.location.replace('/users/sign_in');
  }
});
