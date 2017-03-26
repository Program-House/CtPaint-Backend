crypto = require "../crypto"
log = (require "../log").log
user = require "../db/user"
administrator = require "../db/administrator"
cryptico = require "cryptico"



module.exports = (app, dbConnection) ->

  app.post "/api/admin/signin", (req, res) ->
    decryption = crypto.decrypt req.body.cipher

    if decryption.status isnt "success"
      log decryption
    else
      body = JSON.parse decryption.plaintext

      administrator.certify dbConnection, body, (result) ->
        if result.msg is "success"
          body = 
            msg: "success"
            sessionToken: result.sessionToken

          encryption = cryptico.encrypt (JSON.stringify body), result.clientsKey

          if encryption.status is "success"
            res.send (JSON.stringify (cipher: encryption.cipher))
          else
            encryptionProblem = new Error "Encryption failed"
            throw encryptionProblem


  
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


