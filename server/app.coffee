fs = require "fs"
express = require "express"
app = express()
http = require "http"
join = (require "path").join
bodyParser = require "body-parser"
passport = require "passport"
r = require "rethinkdb"
log = (require "./log").log
router = require "./router"

dbConnection = null
PORT = process.argv[3] or 2984
dir = process.argv[2]

rPack = host: "localhost", port: 28015
r.connect rPack, (err, conn) ->
  if err then throw err
  dbConnection = conn
  log "Connected to database"
  start()

app.use bodyParser.json()
app.use "/home", (express.static (join __dirname, "../home/development"))
app.use passport.initialize()
app.use passport.session()

start = ->

    router app, dbConnection

    httpServer = http.createServer app

    httpServer.listen PORT, ->
      log ("Running on " + PORT)


