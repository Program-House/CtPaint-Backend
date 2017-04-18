crypto = require "../../crypto"
newUser = require "../../db/User/new"
app = (require "../../Main").getApp()

module.exports = (path) ->
    app.post path.get, (req, res) ->
        crypto.decrypt req.body.cipher, (result) ->
            newUser result, (pack) ->
                res.send (JSON.stringify pack)