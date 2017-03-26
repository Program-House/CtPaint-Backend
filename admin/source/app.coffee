app = Elm.Main.fullscreen()
signIn = require "./Communication/sign-in"
Keys = require "./Security/keys"

Keys.saveServersKey app
Keys.makeClientKey app
app.ports.signIn.subscribe (signIn app.ports.signInResult.send)
