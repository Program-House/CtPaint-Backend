r = require "rethinkdb"
db = r.db "ctpaint"
random = require "../random"
cryptico = require "cryptico"


module.exports.certify = (connection, body, next) ->
    getAdmins connection, body.username, (result) ->
        if result.length > 1
            tooManyResults = new Error "More than one admin with that username"
            throw tooManyResults

        if result.length is 0
            next (msg: "admin does not exist")

        admin = result[0]

        if (random.hash body.password) is admin.hash
            token = random.getString()

            updateAdmin body, next, connection,
                session: token
                publicKey: body.clientsKey


updateAdmin = (body, next, connection, updates) ->
    db.table "administrator"
        .filter ((r.row "username").eq body.username)
        .update updates
        .run connection, (err, result) ->
            if err then throw err
            
            if result.replaced isnt 1
                replacedTooMany = new Error "Replaced too many administrators in update"
                throw replacedTooMany

            next 
                msg: "success"
                sessionToken: updates.token
                clientsKey: body.clientsKey


getAdmins = (connection, username, next) ->
    db.table "administrator"
        .filter ((r.row "username").eq username)
        .run connection, (err, cursor) ->
            if err then throw err
            cursor.toArray (err, result) ->
                if err then throw err
                next result