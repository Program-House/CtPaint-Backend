r = require "rethinkdb"
db = r.db "ctpaint"

module.exports.all = (connection, body, next) ->
    db.table "user"
        .run connection, (err, cursor) ->
            if err then throw err
            cursor.toArray (err, result) ->
                console.log result