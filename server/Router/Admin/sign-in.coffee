crypto = require "../../crypto"
verify = require "../../db/Admin/verify"
cryptico = require "cryptico"
app = (require "../../Main").getApp()

module.exports = (path) ->
    app.post path.get, (req, res) ->
        crypto.decrypt req.body.cipher, (json) ->
            verify.password json, (result) ->
                if result.msg is "success"
                    reply result, res


reply = ({clientsKey, sessionToken}, res) ->
    body = JSON.stringify
        msg: "success"
        sessionToken: sessionToken

    { cipher, status } = cryptico.encrypt body, clientsKey

    if status is "success"
        res.send (JSON.stringify {cipher})
    else
        console.error "Encryption failed"