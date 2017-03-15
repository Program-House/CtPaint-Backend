r = require "rethinkdb"
db = r.db "ctpaint"
email = require "../email"
hash = require "../hash"
verification = require "./verification"

module.exports.new = (connection, body, next) ->
  emailExists connection, body.email, (exists) ->
    if exists
      next (msg: "Email already exists")
    else
      db.table "user"
        .insert [ makeUser body ]
        .run connection, (err, result) ->
          if err then throw err
          code = hash.salt() + hash.salt()
          email.sendVerification body.email code
          verification.new_ connection email code, ->
            next (msg: "Successfully created user")


emailExists = (connection, email, next) ->
  db.table "user" 
    .filter ((r.row "email").eq email)
    .run connection, (err, cursor) ->
      if err then throw err
      cursor.toArray (err, result) ->
        if err then throw err
        next (result.length > 0)


makeUser = (body) ->
  salt = hash.salt()

  username: body.username
  email: body.email
  verified: false
  salt: salt
  hash: hash (salt + body.password)



