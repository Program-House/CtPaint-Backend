util = require "gulp-util"
cp = require "child_process"

module.exports.format = ->
  cp.exec "elm-format ./ --yes", -> 0

module.exports.make = (app) ->
  ->
    cp.exec (elmCommand app), handleStdOut


handleStdOut = (error, stdout) ->
  if error
    elm = util.colors.cyan "Elm"
    errorMsg = util.colors.red (String error)
    util.log elm, errorMsg

  out = stdout.split "\n"
  out.pop()
  out.forEach (line) ->
    util.log (util.colors.cyan "Elm"), line

elmCommand = (app) ->
  [ 
    "cd"
    app
    "&&"
    "elm-make"
    "source/Main.elm"
    "--output"
    "development/elm.js"
  ].join " "
