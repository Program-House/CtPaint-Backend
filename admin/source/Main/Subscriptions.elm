module Main.Subscriptions exposing (subscriptions)

import Main.Model exposing (Model)
import Main.Message exposing (Message(..))
import Ports


subscriptions : Model -> Sub Message
subscriptions model =
    Sub.batch
        [ Ports.post Post
        , Ports.signInResult SignInResult
        ]
