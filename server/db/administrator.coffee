r = require "rethinkdb"
db = r.db "ctpaint"
hash = require "../hash"
cryptico = require "cryptico"


module.exports.update = (connection, body, next) ->
  adminExists connection, body.username, (result) ->

    if result.length > 0
      if (hash.get body.password) is result[0].hash
        db.table "administrator"
          .update (session : body.sessionKey)
          .run connection, (err, result) ->
            if err then throw err
            encryption = cryptico.encrypt "Success", body.sessionKey
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