_ = require "lodash"
app = Elm.Main.fullscreen()
Model = require "./Main/Model"
cryptico = require "cryptico"
signIn = require "./SignIn/Request"
Random = require "./Security/random"


app.ports.saveServersKey.subscribe (key) ->
    Model.setState "serversKey", key


app.ports.makeClientKey.subscribe ->
    rsa = cryptico.generateRSAKey Random.getString(), 1024
    key = cryptico.publicKeyString rsa

    Model.setState "rsa", rsa
    Model.setState "clientsKey", key


app.ports.signIn.subscribe (signIn app.ports.signInResult.send)
