$(document).on "page:update", ->
  $('.alert').fadeOut(5000);
  $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
  return
