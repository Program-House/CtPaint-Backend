gulp = require "gulp"
go = require "gulp-go"

paths =
  server: "./server.go",

gulp.task "server", ->
  go.run paths.server

gulp.task "watch", ->
  serverFiles = [
    paths.server
  ]

  gulp.watch paths.server, [ "server" ]


gulp.task "default", [ "watch", "server" ]
