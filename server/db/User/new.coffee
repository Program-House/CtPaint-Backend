r = require "rethinkdb"
db = r.db "ctpaint"
exists = require "./exists"
sendVerification = (require "../../email").sendVerification
verification = require "../verification"
random = require "../../random"


module.exports = (connection, body, next) ->
    exists connection, body.email, (exists) ->
        if exists
            next (msg: "Email already exists")
        else
            db.table "user"
                .insert [ make body ]
                .run connection, (err, result) ->
                    if err then throw err
                    insert connection, body.email, result, next


insert = (connection, email, result, next) ->
    token = random.getString() + random.getString()
    sendVerification email, token
    verification.new_ connection, email, token, ->
        next (msg: "Successfully created user")


module.exports.make = make =  (body) ->
    salt = random.getString()

    username: body.username
    email: body.email
    verified: false
    salt: salt
    hash: random.hash (salt + body.password)