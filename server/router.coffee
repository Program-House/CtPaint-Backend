_ = require "lodash"
join = (require "path").join
user = require "./db/user"
crypto = require "./crypto"
log = (require "./log").log


homeAppPaths = [
  "/"
  "/register"
]

homeApp = (req, res) ->
  (res.status 200).sendFile (join __dirname, "../home/development/index.html")

module.exports = (app, dbConnection) ->

  _.forEach homeAppPaths, (path) -> app.get path, homeApp

  app.post "/api/register", (req, res) ->
    decryption = crypto.decrypt (req.body.cipher)

    if decryption.status isnt "success"
      log decryption
    else
      body = JSON.parse decryption.plaintext
      
      user.new_ dbConnection, body, (pack) ->
        res.send (JSON.stringify pack)

  app.get "/api/key", (req, res) ->
    res.send crypto.publicKey


