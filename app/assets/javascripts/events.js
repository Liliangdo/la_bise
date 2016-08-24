$('.date').datepicker({
  toggleActive: true,
  todayHighlight: true,
  language: 'fr',
});


$('#iconified').on('keyup', function() {
    var input = $(this);
    if(input.val().length === 0) {
        input.addClass('empty');
    } else {
        input.removeClass('empty');
    }
});
