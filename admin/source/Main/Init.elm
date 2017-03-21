module Main.Init exposing (model, cmd)

import Main.Model exposing (Model, Page(..))
import Main.Message exposing (Msg(..))
import Api.PublicKey as PublicKey
import Ports exposing (..)


model : Model
model =
    { page = User
    , publicKey = Nothing
    , sessionKey = Nothing
    , usernameField = ""
    , passwordField = ""
    , loggedIn = False
    }


cmd : Cmd Msg
cmd =
    Cmd.batch
        [ PublicKey.get
        , requestSessionKey ()
        ]
