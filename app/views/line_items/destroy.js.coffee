$('#cart').html("<%= j render(@cart) %>");
$('#new_order').html("<%= j render :partial => 'orders/form' %>");
$('#item').html("<%= j render :partial => 'shared/item_bar' %>");