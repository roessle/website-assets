
$(document).ready ->
  # Add bar on top of navigation
  $('.navigation-colors').before '<div class=navigation-colors-bar></div>'

  $('.logo').prepend \
    '<a href="/">' +
      '<div class=logo-roessle>' +
        '<div class=logo-hotel-gasthof>Hotel Gasthof</div>' +
        '<div class=logo-stamp-roessle></div>' +
      '</div>' +
    '</a>'
