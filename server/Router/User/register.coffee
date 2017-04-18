crypto = require "../../crypto"
newUser = require "../../db/User/new"
main = require "../../Main"

app = main.getApp()
connection = main.getConnection()

module.exports = (path) ->
    app.post path.get, (req, res) ->
        decryption = crypto.decrypt req.body.cipher, (result) ->
            newUser result, (pack) ->
                res.send (JSON.stringify pack)