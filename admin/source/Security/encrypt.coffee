cryptico = require "cryptico"
Random = require "../Security/random"
Model = require "../Communication/model"

module.exports = (body) ->
    body = Object.assign body,
        clientsKey: Model.state.clientsKey
        salt: Random.getString()

    cryptico.encrypt (JSON.stringify body), Model.state.serversKey
