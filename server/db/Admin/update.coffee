r = require "rethinkdb"
db = r.db "ctpaint"
connection = (require "../../Main").getConnection()

module.exports = (username, updates, next) ->
    db.table "administrator"
        .filter ((r.row "username").eq username)
        .update updates
        .run connection, (err, result) ->
            if err then throw err
            
            if result.replaced isnt 1
                replacedTooMany = new Error "Replaced too many administrators in update"
                throw replacedTooMany

            next()