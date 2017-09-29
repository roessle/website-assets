'use strict';

var $ = require("jquery");
var template = require("./templates/facebook-events.handlebars");

$(function() {
  $.getJSON( "http://facebook-events.roessle.eu/", function( data ) {
    $("#facebook-events").append(template({ events: data.data }));
  });
});
