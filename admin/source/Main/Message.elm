module Main.Message exposing (Msg(..))

import Main.Types exposing (Page(..))
import Http
import Json.Decode as Decode
import SignIn.Message exposing (SignInMsg(..))


type Msg
    = SetPage Page
    | GetPublicKey (Result Http.Error String)
    | GetSessionToken String
    | SignInWrapper SignInMsg
    | GetEncryption String
