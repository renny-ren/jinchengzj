$(function(){
  $('.rucaptcha-image').click(function(){
    var num = Math.floor(Math.random()*1000000000);
    $(this).attr('src', '/rucaptcha/?' + num);
  });
});