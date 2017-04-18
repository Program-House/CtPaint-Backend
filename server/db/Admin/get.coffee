r = require "rethinkdb"
db = r.db "ctpaint"
connection = (require "../../Main").getConnection()

module.exports = (username, next) ->
    db.table "administrator"
        .filter ((r.row "username").eq username)
        .run connection, (err, cursor) ->
            if err then throw err
            cursor.toArray (err, result) ->
                if err then throw err

                if result.length > 1
                    msg = "More than one admin with that username"
                    tooManyResults = new Error msg
                    throw tooManyResults

                if result.length is 0
                    next (msg: "Incorrect username and password")

                next result[0]