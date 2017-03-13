var util = require("gulp-util");
var cp = require("child_process");


module.exports.format = function() {
  cp.exec("elm-format ./ --yes", function() {});
}


module.exports.make = function(app) {
  return function() {
    cp.exec(elmCommand(app), handleStdOut);
  }
}

function handleStdOut(error, stdout) {
  if (error) {
    util.log(
      util.colors.cyan("Elm"),
      util.colors.red(String(error))
    );
  }

  var out = stdout.split("\n");
  out.pop()
  out.forEach(function(line) {
    util.log(util.colors.cyan("Elm"), line);
  });
}


function elmCommand (app) {
  return [
    "cd",
    app,
    "&&",
    "elm-make",
    "source/Main.elm",
    "--output",
    "development/elm.js"
  ].join(" ");
}