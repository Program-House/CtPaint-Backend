express = require "express"
http = require "http"
join = (require "path").join
bodyParser = require "body-parser"
r = require "rethinkdb"
log = (require "./log").log
router = require "./router"

app = express()
module.exports.getApp = -> app

PORT = process.argv[3] or 2984

rPack = host: "localhost", port: 28015
r.connect rPack, (err, connection) ->
    if err then throw err
    module.exports.getConnection = -> connection
    log "Connected to database"
    start()

app.use bodyParser.json()
app.use (bodyParser.urlencoded (extended: true))
app.use "/home", (express.static (join __dirname, "../home/development"))
app.use "/app", (express.static (join __dirname, "../paint/development"))
app.use "/admin", (express.static (join __dirname, "../admin/development"))

start = ->
    router()

    httpServer = http.createServer app

    httpServer.listen PORT, ->
        log ("Running on " + PORT)


