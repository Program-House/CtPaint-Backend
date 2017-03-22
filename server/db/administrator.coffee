r = require "rethinkdb"
db = r.db "ctpaint"
hash = require "../hash"
cryptico = require "cryptico"
hash = require "../hash"


module.exports.update = (connection, body, next) ->
  adminExists connection, body.username, (result) ->

    if result.length > 0
      if (hash.get body.password) is result[0].hash
        db.table "administrator"
          .update (session : body.sessionToken)
          .run connection, (err, result) ->
            if err then throw err

            reply =
              msg: "Success"
              salt: hash.salt()

            stringifiedReply = JSON.stringify reply

            encryption = cryptico.encrypt stringifiedReply, body.publicKey
            next (cipher: encryption.cipher)
      else
        next (msg : "Failure")
    else
      next (msg : "Failure")


adminExists = (connection, username, next) ->
  db.table "administrator"
    .filter ((r.row "username").eq username)
    .run connection, (err, cursor) ->
      if err then throw err
      cursor.toArray (err, result) ->
        if err then throw err
        next result