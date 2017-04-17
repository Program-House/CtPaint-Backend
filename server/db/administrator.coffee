r = require "rethinkdb"
db = r.db "ctpaint"
random = require "../random"
cryptico = require "cryptico"


module.exports.verify = 
    password : (connection, body, next) ->
        getAdmin connection, body.username, (admin) ->
            if (random.hash body.password) is admin.hash
                token = random.getString()

                updates =
                    sessionToken: token
                    publicKey: body.clientsKey
                    lastActivity: Date.now()

                updateAdmin body.username, updates, connection, ->
                    next 
                        msg: "success"
                        sessionToken: updates.sessionToken
                        clientsKey: body.clientsKey

            else
                next (msg: "Incorrect username and password")

    session : (connection, body, next) ->
        getAdmin connection, body.username, (admin) ->
            if body.sessionToken is admin.sessionToken
                if 900000 > Date.now() - admin.lastActivity 
                    updates =
                        lastActivity: Date.now()

                    updateAdmin body.username, updates, connection, ->
                        next admin.publicKey



updateAdmin = (username, updates, connection, next) ->
    db.table "administrator"
        .filter ((r.row "username").eq username)
        .update updates
        .run connection, (err, result) ->
            if err then throw err
            
            if result.replaced isnt 1
                replacedTooMany = new Error "Replaced too many administrators in update"
                throw replacedTooMany

            next()




getAdmin = (connection, username, next) ->
    db.table "administrator"
        .filter ((r.row "username").eq username)
        .run connection, (err, cursor) ->
            if err then throw err
            cursor.toArray (err, result) ->
                if err then throw err

                if result.length > 1
                    tooManyResults = new Error "More than one admin with that username"
                    throw tooManyResults

                if result.length is 0
                    next (msg: "Incorrect username and password")

                next result[0]




