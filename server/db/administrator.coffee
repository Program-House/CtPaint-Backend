r = require "rethinkdb"
db = r.db "ctpaint"
hash = require "../hash"
cryptico = require "cryptico"


module.exports.certify = (connection, body, next) ->
  getAdmins connection, body.username, (result) ->
    if result.length > 1
      tooManyResults = new Error "More than one admin with that username"
      throw tooManyResults

    if result.length is 0
      next (msg: "admin does not exist")

    admin = result[0]

    if (hash.get body.password) is admin.hash
      token = hash.salt()

      updates =
        session: token
        publicKey: body.clientsKey

      db.table "administrator"
        .filter ((r.row "username").eq body.username)
        .update updates
        .run connection, (err, result) ->
          if err then throw err
          
          if result.replaced isnt 1
            replacedTooMany = new Error "Replaced too many administrators in update"
            throw replacedTooMany

          next 
            msg: "success"
            sessionToken: token
            clientsKey: body.clientsKey


getAdmins = (connection, username, next) ->
  db.table "administrator"
    .filter ((r.row "username").eq username)
    .run connection, (err, cursor) ->
      if err then throw err
      cursor.toArray (err, result) ->
        if err then throw err
        next result