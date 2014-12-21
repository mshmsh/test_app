$('#cart').html("<%= j render(@cart) %>");
$('#cart').remove;
$('#item').html("<%= j render :partial => 'shared/item_bar' %>");