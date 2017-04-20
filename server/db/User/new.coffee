r = require "rethinkdb"
db = r.db "ctpaint"
exists = require "./exists"
sendVerification = (require "../../email").sendVerification
verification = require "../verification"
random = require "../../random"
connection = (require "../../Main").getConnection()


module.exports = (body, next) ->
    exists body.email, (itExists) ->
        if itExists
            next (msg: "Email already exists")
        else
            db.table "user"
                .insert [ make body ]
                .run connection, (err, result) ->
                    if err then throw err
                    insert body.email, result, next


insert = (email, result, next) ->
    token = random.getString() + random.getString()
    sendVerification email, token
    verification.new_ email, token, ->
        next (msg: "Successfully created user")


module.exports.make = make =  ({username, email, password}) ->
    salt = random.getString()

    username: username
    email: email
    verified: false
    salt: salt
    hash: random.hash (salt + password)