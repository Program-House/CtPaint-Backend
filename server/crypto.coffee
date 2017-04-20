cryptico = require "cryptico"
secrets = require "../secrets"

RSAKey = cryptico.generateRSAKey secrets.passPhrase, 1024

publicKey = cryptico.publicKeyString RSAKey

module.exports.publicKey = publicKey

module.exports.decrypt = (cipher, onSuccess) ->
    { plaintext, status } = cryptico.decrypt cipher, RSAKey

    if status isnt "success"
        console.log "Descryption failed : ", status
    else
        onSuccess (JSON.parse plaintext)