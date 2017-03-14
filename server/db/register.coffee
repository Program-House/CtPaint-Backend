r = require "rethinkdb"
_ = require "lodash"
sha = require "js-sha256"
db = r.db "ctpaint"

# module.exports = (req) ->
#   salt = makeSalt()


  # r.db "ctpaint"
  #   .table "user"
  #   .insert 

module.exports.newUser = newUser = (connection, body, next) ->
  emailExists connection, body.email, (exists) ->
    if exists
      next (msg: "Email already exists")
    else
      db.table "user"
        .insert [ makeUser body ]
        .run connection, (err, result) ->
          if err then throw err
          next (msg:  "Successfully created user")
    # else
      # console.log "Doesnt exist!"



module.exports.emailExists = emailExists = (connection, email, next) ->
  db.table "user" 
    .filter ((r.row "email").eq email)
    .run connection, (err, cursor) ->
      if err then throw err
      cursor.toArray (err, result) ->
        if err then throw err
        next (result.length > 0)


module.exports.makeUser = makeUser = (body) ->
  salt = makeSalt()

  username: body.username
  email: body.email
  verified: false
  salt: salt
  hash: hash (salt + body.password)



module.exports.hash = hash = (password) ->
  sha password

module.exports.makeSalt = makeSalt = ->
  (_.times 32, randomCharacter).join ""






#   UTIL

randomCharacter = ->
  alphanumeric[ randomIndex() ]

alphanumeric = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

randomIndex = ->
  Math.floor (Math.random() * (alphanumeric.length - 1))