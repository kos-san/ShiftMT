$(document).ready(function() {
  $('.text-confirmation').click(function() {
    $(this).find('.mouse').text("変更");
  });
  
  $('.close').click(function() {
    $('.test').css('display','none');
  });

  $('.infomation').click(function() {
    $(this).find('.cation').fadeOut();
    $(this).find('#infomation').fadeIn();
  });

  $('.post').click(function() {
    $('.contact-form').fadeIn();
  });

  $('#form-close').click(function() {
    $('.contact-form').fadeOut();
  });

});