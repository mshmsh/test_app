$(document).on "page:update", ->
  $('.alert').delay(5000).fadeOut();
  $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
  return
