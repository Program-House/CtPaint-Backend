crypto = require "../crypto"
log = (require "../log").log
path = (require "./path")("/api")
user = require "../db/user"

Admin = require "./Admin"

module.exports = (app, dbConnection) ->

    Admin (path "Admin"), app, dbConnection

    app.post "/api/register", (req, res) ->
        decryption = crypto.decrypt req.body.cipher, (result) ->
            user.new_ dbConnection, result, (pack) ->
                res.send (JSON.stringify pack)

     app.get "/api/key", (req, res) ->
          res.send crypto.publicKey
