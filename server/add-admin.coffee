r = require "rethinkdb"
db = r.db "ctpaint"
hash = require "./hash"

rPack = host: "localhost", port: 28015
r.connect rPack, (err, conn) ->
  if err then throw err
  console.log "Connected to database"

  db.table "administrator"
    .insert [ make() ]
    .run conn, (err, result) ->
      if err then throw err
      console.log result


make = ->
  username: "chadtech"
  hash: hash.get ""
  session: ""