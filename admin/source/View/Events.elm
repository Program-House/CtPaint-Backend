module View.Events exposing (..)

import Html exposing (Attribute)
import Html.Events exposing (on, keyCode)
import Main.Message exposing (Msg(..))
import Json.Decode as Json


ifEnter : (Bool -> Msg) -> Attribute Msg
ifEnter msg =
    on "keydown" <| Json.map (msg << (==) 13) keyCode
