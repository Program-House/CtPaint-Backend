var gulp = require("gulp");
var stylus = require("./gulp-processes/stylus.js");
var browserify = require("./gulp-processes/browserify");
var elm = require("./gulp-processes/elm");

var production = false;
var app = "home";
var paths = (function getPaths(app) {
  return {
    development: "./" + app + "/development",
    distribution: "./" + app + "/distribution",
    mainElm: "./" + app + "/source/Main.elm",
    elm: "./" + app + "/source/**/*.elm",
    mainCss: "./" + " ./source/Styles/main.styl",
    css: "./" + app + "/source/**/*.styl",
    mainJs: "./" + app + "/source/app.js",
    js: "./" + app + "/source/*.js"
  };
})(app)

gulp.task("js", browserify(
  paths.mainJs, 
  paths.development,
  production
));

gulp.task("stylus", stylus(paths));

gulp.task("elm", ["elm-format", "elm-make"]);
gulp.task("elm-format", elm.format)
gulp.task("elm-make", elm.make(app));

gulp.task("server", function() {
  require("./server/app.js");
});

gulp.task("distribution", function() {
  production = true;
  gulp.start("default");

  return gulp
    .src(paths.development + "/**/*")
    .pipe(gulp.dest(paths.distribution));
})

gulp.task("watch", function() {
  gulp.watch(paths.elm, ["elm"]);
  gulp.watch(paths.css, ["stylus"]);
  gulp.watch(paths.js, ["js"]);
  gulp.watch([ app + "/development/index.html", "./server/app.js"], ["server"])
})

gulp.task("default", ["watch", "elm", "js", "stylus", "server"]);
