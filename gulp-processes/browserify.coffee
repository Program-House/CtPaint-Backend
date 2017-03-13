browserify = require "browserify"
gulp = require "gulp"
source = require "vinyl-source-stream"
buffer = require "vinyl-buffer"

module.exports = (from, to, production) ->
  config = {
    debug: not production
    cache: {}
  }

  -> 
    browserify from, config
      .bundle()
      .pipe (source "app.js")
      .pipe buffer()
      .pipe (gulp.dest to)