$('#cart').html("<%= j render(@cart) %>").show 'blind' , 700
$('#current_item').css('background-color': '#88ff88').animate
  'background-color': "#ffffff"
, 1000
$('#j-header').html("<%= j render :partial => 'layouts/header' %>")