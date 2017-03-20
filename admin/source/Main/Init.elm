module Main.Init exposing (model, cmd)

import Main.Model exposing (Model, Page(..))
import Main.Message exposing (Msg(..))
import Api.PublicKey as PublicKey


model : Model
model =
    { page = User
    , publicKey = Nothing
    , usernameField = ""
    , passwordField = ""
    , loggedIn = False
    }


cmd : Cmd Msg
cmd =
    PublicKey.get
