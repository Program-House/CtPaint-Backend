r = require "rethinkdb"
db = r.db "ctpaint"

module.exports.new_ = (connection, email, code, next) ->
  db.table "verification"
    .insert [ (make email, code) ]
    .run connection, (err, result) ->
        if err then throw err
        next()

module.exports.make = make = (email, code) ->
  email: email
  code: code