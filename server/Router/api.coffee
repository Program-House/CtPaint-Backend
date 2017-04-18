crypto = require "../crypto"
path = (require "./path")("/api")

Admin = require "./Admin"
User = require "./User"

app = (require "../Main").getApp()

module.exports = ->

    Admin (path "Admin")

    User path

    app.get "/api/key", (req, res) ->
        res.send crypto.publicKey
