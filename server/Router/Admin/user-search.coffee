crypto = require "../../crypto"
verify = require "../../db/Admin/verify"
main = require "../../Main"

app = main.getApp()
connection = main.getConnection()

module.exports = (path) ->
    app.post path.get, (req, res) ->
        crypto.decrypt req.body.cipher, (json) ->
            verify.session connection, json, (publickKey) ->
                search json, publickKey

search = (json, publickKey) ->
    0
    # switch json.parameters
    #     when "ByEmail"
