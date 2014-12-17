$("#notice").hide()
$('#cart').html("<%= j render(@cart) %>").show 'blind' , 700
$('#current_item').css('background-color': '#88ff88').animate
  'background-color': "#ffffff"
, 1000
$('#item').html("<%= j render :partial => 'shared/item_bar' %>");
$('.product-item').html("<%= j render :partial => 'shared/item_bar_cover' %>");

