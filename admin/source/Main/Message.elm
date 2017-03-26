module Main.Message exposing (Msg(..))

import Main.Types exposing (Page(..))
import Http
import Json.Decode as Decode
import SignIn.Message exposing (SignInMsg(..))
import User.Message exposing (UserMsg(..))


type Msg
    = SetPage String
    | GetServersPublicKey (Result Http.Error String)
    | SignInWrapper SignInMsg
    | SignInResult Bool
    | UserWrapper UserMsg
    | Post ( String, String )
