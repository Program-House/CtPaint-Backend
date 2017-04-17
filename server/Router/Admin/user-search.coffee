crypto = require "../../crypto"

module.exports = (path, app, dbConnection) ->
    app.post path.get, (req, res) ->
        crypto.decrypt req.body.cipher, (json) ->
            console.log "ye json", json