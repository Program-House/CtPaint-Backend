cryptico = require "cryptico"
secrets = require "../secrets"

RSAKey = cryptico.generateRSAKey secrets.passPhrase, 1024

publicKey = cryptico.publicKeyString RSAKey

module.exports.publicKey = publicKey

module.exports.decrypt = (cipher) ->
  cryptico.decrypt cipher, RSAKey