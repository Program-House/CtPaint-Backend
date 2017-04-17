module Main.Init exposing (model, cmd)

import Main.Model exposing (Model)
import Main.Types exposing (Page(..))
import Main.Message exposing (Message(..))
import SignIn.Model as SignIn
import User.Model as User
import Api.PublicKey as PublicKey
import Ports


model : Model
model =
    --{ page = UsersPage User.init }
    { page = SignInPage SignIn.init }


cmd : Cmd Message
cmd =
    Cmd.batch
        [ PublicKey.get
        , Ports.makeClientKey ()
        ]
