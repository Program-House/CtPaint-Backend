gulp = require "gulp"
concat = require "gulp-concat"
stylus = require "gulp-stylus"

module.exports = (paths) ->
  console.log paths

  ->
    gulp
      .src [ paths.mainCss, paths.css ]
      .pipe (concat "style.styl")
      .pipe stylus()
      .pipe (gulp.dest paths.development)