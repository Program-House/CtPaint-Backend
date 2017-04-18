r = require "rethinkdb"
db = r.db "ctpaint"


module.exports = search = (connection, filterBy, next) ->
    db.table "user"
        .filter filterBy
        .run connection, (err, cursor) ->
            if err then throw err
            cursor.toArray (err, result) ->
                if err then throw err

                next result


module.exports.byUsername = (connection, username, next) ->
    search connection ((r.row "username").eq username) next

