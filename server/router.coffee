_ = require "lodash"
join = (require "path").join
user = require "./db/user"
crypto = require "./crypto"

homeAppPaths = [
  "/"
  "/register"
]

homeApp = (req, res) ->
  (res.status 200).sendFile (join __dirname, "../home/development/index.html")

module.exports = (app, dbConnection) ->

  _.forEach homeAppPaths, (path) -> app.get path, homeApp

  app.post "/api/register", (req, res) ->
    console.log("REQUEST", crypto.decrypt req.body.cipher)
    # user.new_ dbConnection, req.body, (pack) ->
    #   res.send (JSON.stringify pack)

  app.get "/api/key", (req, res) ->
    res.send crypto.publicKey


