r = require "rethinkdb"
db = r.db "ctpaint"

module.exports = (connection, email, next) ->
    db.table "user"
        .filter ((r.row "email").eq email)
        .run connection, (err, cursor) ->
            if err then throw err

            cursor.toArray (err, result) ->
                if err then throw err

                next (result.length > 0)