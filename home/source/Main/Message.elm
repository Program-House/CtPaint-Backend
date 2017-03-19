module Main.Message exposing (Msg(..))

import Navigation exposing (Location)
import Register.Message exposing (RegisterMsg(..))
import Http


type Msg
    = UrlChange Location
    | GoHome
    | RegisterWrapper RegisterMsg
    | GetPublicKey (String -> Cmd Msg) (Result Http.Error String)
    | GetEncryption ( String, String )
