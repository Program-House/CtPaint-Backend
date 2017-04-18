get = require "./get"
update = require "./update"
random = require "../../random"
connection = (require "../../Main").getConnection()

module.exports.password = (body, next) ->
    get body.username, (admin) ->
        if (random.hash body.password) is admin.hash
            token = random.getString()

            updates = 
                sessionToken: token
                publicKey: body.clientsKey
                lastActivity: Date.now()

            update body.username, updates, ->
                next 
                    msg: "success"
                    sessionToken: updates.sessionToken
                    clientsKey: body.clientsKey

        else
            next (msg: "Incorrect username and password")


module.exports.session = (body, next) ->
    get body.username, (admin) ->
        if body.sessionToken is admin.sessionToken
            if 900000 > Date.now() - admin.lastActivity
                updates =
                    lastActivity: Date.now()

                update body.username, updates, ->
                    next admin.publicKey

