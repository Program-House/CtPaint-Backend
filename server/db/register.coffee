r = require "rethinkdb"
_ = require "lodash"
sha = require "js-sha256"
db = r.db "ctpaint"

# module.exports = (req) ->
#   salt = makeSalt()


  # r.db "ctpaint"
  #   .table "user"
  #   .insert 

module.exports.newUser = newUser = (req) ->


module.exports.emailExists = emailExists = (connection, email) ->
  db.table "user" 
    .filter (r.row "email" .eq email)
    .run connection, (err, cursor) ->
      if err then throw err
      cursor.toArray (err, result) ->
        if err then throw err
        console.log (JSON.stringify result, null, 2)

    #     cursor.toArray(function(err, result) {
    #         if (err) throw err;
    #         console.log(JSON.stringify(result, null, 2));
    #     });
    # });

module.exports.makeUser = makeUser = (req) ->
  salt = makeSalt()

  username: req.username
  email: req.email
  verified: false
  salt: salt
  hash: hash (salt + req.password)



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