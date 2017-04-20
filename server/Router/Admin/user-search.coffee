crypto = require "../../crypto"
verify = require "../../db/Admin/verify"
User = require "../../db/User/search"
app = (require "../../Main").getApp()

module.exports = (path) ->
    app.post path.get, ({body}, res) ->
        crypto.decrypt body.cipher, (json) ->
            verify.session json, (publickKey) ->
                search json, publickKey

search = ({parameter}, publickKey) ->
    switch parameter
        when "ByEmail"
            User.byEmail parameter, (result) ->
                console.log "RESULT", result

        when "ByUsername"
            User.byUsername parameter, (result) ->
                console.log "USERNAME RESULT", result
