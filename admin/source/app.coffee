app = Elm.Main.fullscreen()
signIn = require "./Communication/sign-in"
user = require "./Communication/user"
Keys = require "./Security/keys"

Keys.saveServersKey app
Keys.makeClientKey app

app.ports.signIn.subscribe (signIn app.ports.signInResult.send)

app.ports.userSeearch.subcribe (user app.ports.userSearchResult.send)