$(document).on "page:update", ->
  $('.alert').fadeOut(7000);
  $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
  return
