Model = require "../Communication/model"
cryptico = require "cryptico"
Random = require "./random"


module.exports.saveServersKey = (app) ->
    app.ports.saveServersKey.subscribe (key) ->
        Model.setState "serversKey", key


module.exports.makeClientKey = (app) ->
    app.ports.makeClientKey.subscribe ->
        rsa = cryptico.generateRSAKey Random.getString(), 1024
        key = cryptico.publicKeyString rsa

        Model.setState "rsa", rsa
        Model.setState "clientsKey", key