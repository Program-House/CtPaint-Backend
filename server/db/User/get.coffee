r = require "rethinkdb"
db = r.db "ctpaint"
connection = (require "../../Main").getConnection()

module.exports.all = (body, next) ->
    db.table "user"
        .run connection, (err, cursor) ->
            if err then throw err
            cursor.toArray (err, result) ->
                console.log "db/User/get.coffee", result