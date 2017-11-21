$(document).on('click', '.comment-btn', function(){
  id = $(this).data('id');
  $(this).toggleClass('comment-open');
  $('.comment-container[data-id='+id+']').slideToggle('fast');
  $('.arrow[data-id='+id+']').toggleClass('arrow-rotate');
});

$(document).on('click', '.start-comment-btn', function(){
  id = $(this).data('id');
  $('.new_comment[data-id='+id+']').show();
  $(this).hide();
});
