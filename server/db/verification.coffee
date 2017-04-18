r = require "rethinkdb"
db = r.db "ctpaint"
connection = (require "../Main").getConnection()


module.exports.new_ = (email, code, next) ->
  db.table "verification"
    .insert [ (make email, code) ]
    .run connection, (err, result) ->
      if err then throw err
      next()

module.exports.make = make = (email, code) ->
  email: email
  code: code