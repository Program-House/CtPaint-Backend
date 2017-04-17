cryptico = require "cryptico"
secrets = require "../secrets"

RSAKey = cryptico.generateRSAKey secrets.passPhrase, 1024

publicKey = cryptico.publicKeyString RSAKey

module.exports.publicKey = publicKey

module.exports.decrypt = (cipher, onSuccess) ->
    decryption = cryptico.decrypt cipher, RSAKey

    if decryption.status isnt "success"
        log decryption
    else
        onSuccess (JSON.parse decryption.plaintext)