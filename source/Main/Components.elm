module Main.Components exposing (..)

import Html exposing (node, Attribute, Html)
import Main.Message exposing (Msg(..))


card : List (Attribute Msg) -> List (Html Msg) -> Html Msg
card =
    node "card"
