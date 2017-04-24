gulp = require "gulp"
util = require "gulp-util"
cp = require "child_process"
server = require "./gulp/server"

paths =
    app: "./source/main.go",

gulp.task "server", (server paths.app)

gulp.task "watch", ->
    gulp.watch paths.app, [ "server" ]


gulp.task "default", [ "watch", "server" ]
