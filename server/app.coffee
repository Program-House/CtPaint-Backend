fs = require "fs"
express = require "express"
app = express()
http = require "http"
join = (require "path").join
bodyParser = require "body-parser"
passport = require "passport"
Strategy = (require "passport-local").Strategy
r = require "rethinkdb"
log = (require "./log").log
register = require "./db/register"

dbConnection = null
PORT = process.argv[3] or 2984
dir = process.argv[2]

rPack = host: "localhost", port: 28015
r.connect rPack, (err, conn) ->
  if err then throw err
  dbConnection = conn
  log "Connected to database"

app.use bodyParser.json()
app.use (express.static (join __dirname, "../home/development"))
app.use passport.initialize()
app.use passport.session()

app.get "/*", (req, res, next) ->
  (res.status 200).sendFile (join __dirname, "../home/development/index.html")

app.post "/api/register", (req, res, next) ->
  register.newUser dbConnection, req.body, (pack) ->
    res.send (JSON.stringify pack)


app.post "/api/login",
  (passport.authenticate "local", { failureRedirect: "/login" })
  (req, res) ->
    res.redirect "/"

httpServer = http.createServer app

httpServer.listen PORT, ->
  log ("Running on " + PORT)


