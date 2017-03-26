module Main.Init exposing (model, cmd)

import Main.Model exposing (Model)
import Main.Types exposing (Page(..))
import Main.Message exposing (Msg(..))
import SignIn.Model as SignIn
import Api.PublicKey as PublicKey
import Ports


model : Model
model =
    { page = SignInPage SignIn.init }


cmd : Cmd Msg
cmd =
    Cmd.batch
        [ PublicKey.get
        , Ports.makeClientKey ()
        ]
