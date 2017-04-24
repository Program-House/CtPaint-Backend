gulp = require "gulp"
util = require "gulp-util"
cp = require "child_process"

paths =
  app: "./source/main.go",


server = null
gulp.task "server", ->
  p = cp.exec "go build -o build/server ./source/main.go"

  p.stdout.on "data", (data) ->
    console.log "DATA"
    lines = data.toStrign().split("\n")
    lines.pop()

    lines.forEach (l) ->
      util.log l

  p.stderr.on "data", (data) ->
    lines = data.toString().split("\n")
    lines.pop()

    lines.forEach (l) -> 
      util.log (util.colors.red l)

  p.on "close", ->
    if server?
      server.kill()

    util.log "Running Server"

    server = cp.exec "./build/server"

    server.stdout.on "data", (data) ->
      lines = data.toString().split("\n")
      lines.pop()

      lines.forEach (l) -> 
        util.log l

    server.stderr.on "data", (data) ->
      lines = data.toString().split("\n")
      lines.pop()

      lines.forEach "data", (l) -> 
        util.log (util.colors.red l)



gulp.task "watch", ->
  gulp.watch paths.app, [ "server" ]


gulp.task "default", [ "watch", "server" ]
