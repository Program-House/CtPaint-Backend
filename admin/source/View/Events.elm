module View.Events exposing (..)

import Html exposing (Attribute)
import Html.Events exposing (on, keyCode)
import Main.Message exposing (Message(..))
import Json.Decode as Json


ifEnter : (Bool -> Message) -> Attribute Message
ifEnter msg =
    on "keydown" <| Json.map (msg << (==) 13) keyCode
