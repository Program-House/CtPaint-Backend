crypto = require "../crypto"
log = (require "../log").log
user = require "../db/user"
administrator = require "../db/administrator"


module.exports = (app, dbConnection) ->

  app.post "/api/admin/login", (req, res) ->
    decryption = crypto.decrypt req.body.cipher

    if decryption.status isnt "success"
      log decryption
    else
      body = JSON.parse decryption.plaintext

      administrator.update dbConnection, body, (pack) ->
        res.send (JSON.stringify pack)
  
  app.post "/api/register", (req, res) ->
    decryption = crypto.decrypt req.body.cipher

    if decryption.status isnt "success"
      log decryption
    else
      body = JSON.parse decryption.plaintext
      
      user.new_ dbConnection, body, (pack) ->
        res.send (JSON.stringify pack)

  app.get "/api/key", (req, res) ->
    res.send crypto.publicKey

