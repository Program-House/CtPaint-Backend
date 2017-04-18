r = require "rethinkdb"
db = r.db "ctpaint"
connection = (require "../../Main").getConnection()


module.exports = search = (filterBy, next) ->
    db.table "user"
        .filter filterBy
        .run connection, (err, cursor) ->
            if err then throw err
            cursor.toArray (err, result) ->
                if err then throw err

                next result


module.exports.byUsername = (username, next) ->
    search ((r.row "username").eq username) next

