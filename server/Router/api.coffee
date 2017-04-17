crypto = require "../crypto"
log = (require "../log").log
user = require "../db/user"

SignIn = require "./sign-in"

module.exports = (app, dbConnection) ->

    SignIn app, dbConnection

    app.post "/api/register", (req, res) ->
        decryption = crypto.decrypt req.body.cipher, (result) ->
            user.new_ dbConnection, result, (pack) ->
                res.send (JSON.stringify pack)

     app.get "/api/key", (req, res) ->
          res.send crypto.publicKey
