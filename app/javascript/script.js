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

  // $('.infomation').click(function() {
  //   // $(this).find('.cation').fadeIn();
  //   $(this).find('#infomation').fadeOut();
  // });

});