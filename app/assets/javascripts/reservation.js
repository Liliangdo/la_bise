$(document).ready(function() {
  // On change
  $('#reservation_guest').on('change', function(event){
    $('#price').hide();
    $('#fees').hide();
    $('#total-price').hide();
    // Save unit price
    var unit_price = $("#reservation-informations").data('price');
    // Collecte the number place choice on change
    var number_place = $('#reservation_guest')["0"].selectedIndex;
    // Collecte the rate fees
    var rate_fees = $("#reservation-informations").data('frais');
    // Calculate the price number place * unit price
    var price = unit_price * number_place;
    // Calculate the fees
    var fees = Math.round(rate_fees * price);
    // Calculate the total
    var total_price = price + fees;

    $('#price').text('Le prix est de ' + price + ' €');
    $('#fees').text('Les frais sont de ' + fees + ' €');
    $('#total-price').text('Le montant total est de ' + total_price + ' €');

    $('#price').slideDown();
    $('#fees').slideDown();
    $('#total-price').slideDown();
  });

});
