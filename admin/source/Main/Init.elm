module Main.Init exposing (model, cmd)

import Main.Model exposing (Model)
import Main.Types exposing (Page(..))
import Main.Message exposing (Msg(..))
import Api.PublicKey as PublicKey
import Ports


model : Model
model =
    { page = User
    , serversPublicKey = Nothing
    , sessionToken = Nothing
    , clientsPublicKey = Nothing
    , usernameField = ""
    , passwordField = ""
    , loggedIn = False
    , withEncryption = always Cmd.none
    }


cmd : Cmd Msg
cmd =
    Cmd.batch
        [ PublicKey.get
        , Ports.requestSessionToken ()
        ]
