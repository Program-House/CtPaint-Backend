gulp = require "gulp"
stylus = require "./gulp-processes/stylus"
browserify = require "./gulp-processes/browserify"
elm = require "./gulp-processes/elm"

production = false
app = "home"
paths =
  development: "./" + app + "/development"
  distribution: "./" + app + "/distribution"
  mainElm: "./" + app + "/source/Main.elm"
  elm: "./" + app + "/source/**/*.elm"
  mainCss: "./" + " ./source/Styles/main.styl"
  css: "./" + app + "/source/**/*.styl"
  mainJs: "./" + app + "/source/app.js"
  js: "./" + app + "/source/*.js"

{ mainJs, development } = paths
gulp.task "js", browserify mainJs, development, production

gulp.task "stylus", stylus paths

gulp.task "elm", [ "elm-format", "elm-make"]
gulp.task "elm-format", elm.format
gulp.task "elm-make", elm.make app

gulp.task "server", ->
  require "./server/app.js"

gulp.task "distribution", ->
  production = true
  gulp.start "default"
  gulp
    .src (paths.development + "/**/*")
    .pipe (gulp.dest path.distribution)

gulp.task "watch", ->
  serverFiles = [
    app.development + "/index.html"
    "./server/app.js"
  ]

  gulp.watch paths.elm, [ "elm" ]
  gulp.watch paths.css, [ "stylus" ]
  gulp.watch paths.js, [ "js" ]
  gulp.watch serverFiles, [ "server" ]

gulp.task "default", [ "watch", "elm", "js", "stylus", "server" ]
