crypto = require "../../crypto"
log = (require "../../log").log
administrator = require "../../db/administrator"
cryptico = require "cryptico"


module.exports = (path, app, dbConnection) ->
    app.post path.get, (req, res) ->
        crypto.decrypt req.body.cipher, (json) ->
            administrator.certify dbConnection, json, (result) ->
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