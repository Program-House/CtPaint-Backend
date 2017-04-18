r = require "rethinkdb"
db = r.db "ctpaint"
connection = (require "../../Main").getConnection()


module.exports = (email, next) ->
    db.table "user"
        .filter ((r.row "email").eq email)
        .run connection, (err, cursor) ->
            if err then throw err

            cursor.toArray (err, result) ->
                if err then throw err

                next (result.length > 0)