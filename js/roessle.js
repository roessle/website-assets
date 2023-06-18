'use strict';

var $ = require("jquery");

// $(function() {
//   $(".navigation-colors-bar").before("<div class=navigation-colors-bar></div>");
// });


$(function() {
  $("#disable-google-translate").on( "click", function() {
      document.cookie = "googtrans=; max-age=0; Domain=.roessle.eu; Path=/"
      document.cookie = "googtrans=; max-age=0; Domain='www.roessle.eu'; Path=/"
      document.cookie = "googtrans=; max-age=0; Domain=''; Path=/"
      document.cookie = "googtrans=; max-age=0"
      window.document.location.href = "/";
  } );
});