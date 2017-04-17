crypto = require "../../crypto"
admin = require "../../db/administrator"

module.exports = (path, app, dbConnection) ->
    app.post path.get, (req, res) ->
        crypto.decrypt req.body.cipher, (json) ->
            admin.verify.session dbConnection, json, (publickKey) ->
                console.log "ye json", publickKey