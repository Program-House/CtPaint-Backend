crypto = require "../../crypto"
newUser = require "../../db/User/new"


module.exports = (path, app, dbConnection) ->
    app.post path.get, (req, res) ->
        decryption = crypto.decrypt req.body.cipher, (result) ->
            newUser dbConnection, result, (pack) ->
                res.send (JSON.stringify pack)