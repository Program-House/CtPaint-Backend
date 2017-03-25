r = require "rethinkdb"
db = r.db "ctpaint"
email = require "../email"
hash = require "../hash"
verification = require "./verification"

module.exports.new_ = (connection, body, next) ->
  emailExists connection, body.email, (exists) ->
    if exists
      next (msg: "Email already exists")
    else
      db.table "user"
        .insert [ makeUser body ]
        .run connection, (err, result) ->
          if err then throw err
          code = hash.salt() + hash.salt()
          email.sendVerification body.email, code
          verification.new_ connection, body.email, code, ->
            next (msg: "Successfully created user")


module.exports.getAll = (connection, body, next) ->
  db.table "user"
    .run connection, (err, cursor) ->
      if err then throw err
      cursor.toArray (err, result) ->
        console.log result


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
  hash: hash.get (salt + body.password)



