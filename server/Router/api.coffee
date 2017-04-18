crypto = require "../crypto"
log = (require "../log").log
path = (require "./path")("/api")
newUser = require "../db/User/new"

Admin = require "./Admin"
User = require "./User"

app = (require "../Main").getApp()

module.exports = ->

    Admin (path "Admin")

    User path

    app.get "/api/key", (req, res) ->
        res.send crypto.publicKey
