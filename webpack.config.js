var path = require("path");
module.exports = {
	cache: true,
	entry: {
		roessle: "./js/roessle.js",
	},
	output: {
		path: path.join(__dirname, "dist/js"),
		filename: "[name].js",
	},
  externals: {
    jquery: "jQuery"
  }
};
