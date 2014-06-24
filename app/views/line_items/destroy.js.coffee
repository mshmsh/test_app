$('#cart').html "<%= j render(@cart) %>"
$('#cart').remove 'blind', 700
$('#cart').hide 'blind', 700 if $('#cart tbody tr').length is 1
$('#j-header').html("<%= j render :partial => 'layouts/header' %>")