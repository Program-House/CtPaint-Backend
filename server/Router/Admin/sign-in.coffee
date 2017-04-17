crypto = require "../../crypto"
log = (require "../../log").log
admin = require "../../db/administrator"
cryptico = require "cryptico"


module.exports = (path, app, dbConnection) ->
    app.post path.get, (req, res) ->
        crypto.decrypt req.body.cipher, (json) ->
            admin.verify.password dbConnection, json, (result) ->
                if result.msg is "success"
                    reply result, res


reply = (result, res) ->
    body =
        msg: "success"
        sessionToken: result.sessionToken

    encryption = cryptico.encrypt (JSON.stringify body), result.clientsKey

    if encryption.status is "success"
        res.send (JSON.stringify (cipher: encryption.cipher))
    else
        console.error "Encryption failed"