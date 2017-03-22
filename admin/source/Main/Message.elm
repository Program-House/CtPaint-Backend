module Main.Message exposing (Msg(..))

import Main.Types exposing (Page(..))
import Http
import Json.Decode as Decode
import SignIn.Message exposing (SignInMsg(..))


type Msg
    = SetPage Page
    | GetServersPublicKey (Result Http.Error String)
    | GetClientsPublicKey String
    | GetSessionToken String
    | SignInWrapper SignInMsg
    | GetEncryption String
    | GetPlaintext String
