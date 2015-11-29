var path = require("path");
module.exports = {
    cache: true,
    entry: {
        roessle: "./js/roessle.js",
        "facebook-events": "./js/facebook-events.js",
    },
    module: {
        loaders: [{
            test: /\.handlebars$/,
            loader: "handlebars-loader",
            query: {
                helperDirs: [
                    path.resolve("js/helpers")
                ]
            }
        }]
    },
    output: {
        path: path.join(__dirname, "dist/js"),
        filename: "[name].js",
    }
};
