gulp = require "gulp"
stylus = require "./gulp-processes/stylus"
browserify = require "./gulp-processes/browserify"
elm = require "./gulp-processes/elm"
tests = require "./gulp-processes/tests"
coffeelint = require "gulp-coffeelint"
{app} = require "./config"

production = false
paths =
  server: "./server/**/*.coffee",
  tests: "./tests/**/*.coffee"

{ mainJs, development } = paths
gulp.task "coffee", (browserify mainJs, development, production)

gulp.task "stylus", stylus paths

gulp.task "elm", [ "elm-format", "elm-make"]
gulp.task "elm-format", elm.format
gulp.task "elm-make", elm.make app

gulp.task "server tests", tests

gulp.task "server", ->
  require "./server/Main.coffee"

gulp.task "lint", ->
  gulp.src paths.server
    .pipe(coffeelint())
    .pipe(coffeelint.reporter())

gulp.task "distribution", ->
  production = true
  gulp.start "default"
  gulp
    .src (paths.development + "/**/*")
    .pipe (gulp.dest path.distribution)

gulp.task "watch", ->
  serverFiles = [
    app.development + "/index.html"
    paths.server
  ]

  gulp.watch paths.elm, [ "elm" ]
  gulp.watch paths.css, [ "stylus" ]
  gulp.watch paths.coffee, [ "coffee" ]
  gulp.watch serverFiles, [ "server", "lint" ]
  # gulp.watch paths.server, [ "server tests" ]
  gulp.watch paths.rests, [ "server tests"]

gulp.task "default", [ "watch", "elm", "coffee", "stylus", "server" ]
