get = require "./get"
update = require "./update"
random = require "../../random"

module.exports.password = ({username, password, clientsKey}, next) ->
    get username, (admin) ->
        if (random.hash password) is admin.hash
            token = random.getString()

            updates =
                sessionToken: token
                publicKey: clientsKey
                lastActivity: Date.now()

            update username, updates, ->
                next
                    msg: "success"
                    sessionToken: updates.sessionToken
                    clientsKey: clientsKey
        else
            next (msg: "Incorrect username and password")

module.exports.session = ({username, sessionToken}, next) ->
    get username, (admin) ->
        if sessionToken is admin.sessionToken
            if 900000 > Date.now() - admin.lastActivity
                updates =
                    lastActivity: Date.now()

                update username, updates, ->
                    next admin.publicKey

