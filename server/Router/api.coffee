crypto = require "../crypto"
log = (require "../log").log
path = (require "./path")("/api")
newUser = require "../db/User/new"

Admin = require "./Admin"
User = require "./User"

module.exports = (app, dbConnection) ->

    Admin (path "Admin"), app, dbConnection

    User path, app, dbConnection

    app.post "/api/register", (req, res) ->
        decryption = crypto.decrypt req.body.cipher, (result) ->
            newUser dbConnection, result, (pack) ->
                res.send (JSON.stringify pack)

     app.get "/api/key", (req, res) ->
          res.send crypto.publicKey
