gulp = require "gulp"
stylus = require "./gulp-processes/stylus"
browserify = require "./gulp-processes/browserify"
elm = require "./gulp-processes/elm"
tests = require "./gulp-processes/tests"
{app} = require "./config"

production = false
paths =
  development: "./" + app + "/development"
  distribution: "./" + app + "/distribution"
  mainElm: "./" + app + "/source/Main.elm"
  elm: "./" + app + "/source/**/*.elm"
  mainCss: "./" + app + "/source/Styles/main.styl"
  css: "./" + app + "/source/**/*.styl"
  mainJs: "./" + app + "/source/app.js"
  js: "./" + app + "/source/*.js",
  server: "./server/**/*.coffee",
  serverTests: "./tests/**/*.coffee"

{ mainJs, development } = paths
gulp.task "js", browserify mainJs, development, production

gulp.task "stylus", stylus paths

gulp.task "elm", [ "elm-format", "elm-make"]
gulp.task "elm-format", elm.format
gulp.task "elm-make", elm.make app

gulp.task "server tests", tests

gulp.task "server", ->
  require "./server/app.coffee"

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
  gulp.watch paths.js, [ "js" ]
  gulp.watch serverFiles, [ "server" ]
  gulp.watch paths.server, [ "server tests" ]
  gulp.watch paths.serverTests, [ "server tests"]

gulp.task "default", [ "watch", "elm", "js", "stylus", "server", "server tests" ]
