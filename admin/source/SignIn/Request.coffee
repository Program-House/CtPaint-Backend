cryptico = require "cryptico"
decrypt = require "../Security/decrypt"
Random = require "../Security/random"
Requests = require "../Api/Requests"
Model = require "../Main/Model"

module.exports = (next) ->
    (payload) ->
        if Model.state.clientsKey.length is 0
            console.error "We dont have our client key yet"

        if Model.state.serversKey.length is 0
            console.error "We dont have the servers key yet"

        body = JSON.stringify
            username: payload[0]
            password: payload[1]
            clientsKey: Model.state.clientsKey
            salt: Random.getString()

        encryption = cryptico.encrypt body, Model.state.serversKey

        if encryption.status is "success"
            dest = "http://localhost:2984/api/admin/signin"
            body = JSON.stringify cipher: encryption.cipher

            Requests.post dest, body, (cipher) ->
                decrypt cipher, (handleDecryption next)

                (plaintext) ->
                    json = JSON.parse plaintext

        else
            console.log "Encryption was not a success"


handleDecryption = (next) ->
    (plaintext) ->
        json = JSON.parse plaintext

        if json.msg is "success"
            Model.setState "sessionToken", json.sessionToken
            
            next true

