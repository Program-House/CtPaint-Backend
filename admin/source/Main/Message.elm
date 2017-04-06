module Main.Message exposing (Message(..), Handler)

import Main.Types exposing (Page(..))
import Http
import SignIn.Message exposing (SignInMessage(..))
import User.Message exposing (UserMessage(..))


type Message
    = SetPage String
    | GetServersPublicKey (Result Http.Error String)
    | SignInWrapper SignInMessage
    | SignInResult Bool
    | UserWrapper UserMessage
    | Post ( String, String )


type alias Handler a =
    a -> Message
