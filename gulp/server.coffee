util = require "gulp-util"
cp = require "child_process"

server = null


module.exports = (path) ->
    ->
        p = cp.exec ("go build -o build/server " + path)

        p.stdout.on "data", (data) ->
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

                lines.forEach (l) -> 
                    util.log (util.colors.red l)