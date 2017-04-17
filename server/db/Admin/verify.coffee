get = require "./get"
update: require "./update"
random = require "../../random"

moduel.exports.password = (connection, body, next) ->
    get connection, body.username, (admin) ->
        if (random.hash body.password) is admin.hash
            token = random.getString()

            updates = 
                sessionToken: token
                publicKey: body.clientsKey
                lastActivity: Date.now()

            update connection, body.username, updates, ->
                next 
                    msg: "success"
                    sessionToken: updates.sessionToken
                    clientsKey: body.clientsKey

        else
            next (msg: "Incorrect username and password")


module.exports.session = (connection, body, next) ->
    get connection, body.username, (admin) ->
        if body.sessionToken is admin.sessionToken
            if 900000 > Date.now() - admin.lastActivity
                updates =
                    lastActivity: Date.now()

                update connection, body.username, updates, ->
                    next admin.publicKey

