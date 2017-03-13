var browserify = require("browserify");
var gulp = require("gulp");
var source = require("vinyl-source-stream");
var buffer = require("vinyl-buffer");


module.exports = function(from, to, production) {
  var config = {
    debug: !production,
    cache: {},
  };

  return function () {
    return browserify(from, config)
      .bundle()
      .pipe(source("app.js"))
      .pipe(buffer())
      .pipe(gulp.dest(to))
  }
} 