crypto = require "../../crypto"
verify = require "../../db/Admin/verify"

module.exports = (path, app, dbConnection) ->
    app.post path.get, (req, res) ->
        crypto.decrypt req.body.cipher, (json) ->
            verify.session dbConnection, json, (publickKey) ->
                search dbConnection, json, publickKey
                # console.log "ye json", publickKey


search = (connection, json, publickKey) ->
    console.log json 