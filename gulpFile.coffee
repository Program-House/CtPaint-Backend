gulp = require "gulp"
util = require "gulp-util"
cp = require "child_process"
server = require "./gulp/server"

paths =
    main: "./source/main.go"
    go: "./source/**/*.go"

gulp.task "server", (server paths.main)

gulp.task "watch", ->
    gulp.watch paths.go, [ "server" ]


gulp.task "default", [ "watch", "server" ]
