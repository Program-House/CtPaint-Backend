crypto = require "../../crypto"
verify = require "../../db/Admin/verify"
main = require "../../Main"
User = require "../../db/User/search"

app = main.getApp()
connection = main.getConnection()

module.exports = (path) ->
    app.post path.get, (req, res) ->
        crypto.decrypt req.body.cipher, (json) ->
            verify.session connection, json, (publickKey) ->
                search json, publickKey

search = (json, publickKey) ->
    switch json.parameters
        when "ByEmail"
            User.byEmail json.parameter, (result) ->
                console.log "RESULT", result

        when "ByUsername"
            User.byUsername json.parameter, (result) ->
                console.log "USERNAME RESULT", result
