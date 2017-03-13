module Main.Message exposing (Msg(..))

import Navigation exposing (Location)
import Register.Message exposing (RegisterMsg(..))


type Msg
    = UrlChange Location
    | GoHome
    | RegisterWrapper RegisterMsg
