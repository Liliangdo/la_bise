$('.date').datepicker({
  toggleActive: true,
  todayHighlight: true,
  language: 'fr'
});


$.fn.datepicker.dates['fr'] = {
    days: ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"],
    daysShort: ["Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim"],
    daysMin: ["Di", "Lu", "Ma", "Me", "Je", "Ve", "Sa", "Di"],
    months: ["Janvier", "Fevrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Decembre"],
    monthsShort: ["Jan", "Fev", "Mar", "Avr", "Mai", "Jun", "Jul", "Aou", "Sep", "Oct", "Nov", "Dec"],
    today: "Aujourd'hui"
};

