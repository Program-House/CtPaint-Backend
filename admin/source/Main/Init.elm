module Main.Init exposing (model, cmd)

import Main.Model exposing (Model)
import Main.Types exposing (Page(..))
import Main.Message exposing (Msg(..))
import Api.PublicKey as PublicKey
import Ports


model : Model
model =
    { page = User
    , publicKey = Nothing
    , sessionToken = Nothing
    , usernameField = ""
    , passwordField = ""
    , loggedIn = False
    , withEncryption = Nothing
    }


cmd : Cmd Msg
cmd =
    Cmd.batch
        [ PublicKey.get
        , Ports.requestSessionToken ()
        ]
