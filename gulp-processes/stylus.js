var gulp = require("gulp");
var concat = require("gulp-concat");
var stylus = require("gulp-stylus");


module.exports = function(paths) {
  return function() {
    return gulp
      .src([ paths.mainCss, paths.css ])
      .pipe(concat("style.styl"))
      .pipe(stylus())
      .pipe(gulp.dest(paths.development))
  }
}