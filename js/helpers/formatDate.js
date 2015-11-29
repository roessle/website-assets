var moment = require("moment");

module.exports = function (date) {
  return moment(date).locale("de").format("dddd, Do MMMM YYYY");
};
