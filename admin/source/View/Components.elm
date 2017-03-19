module View.Components exposing (..)

import Html exposing (..)
import Main.Message exposing (Msg(..))


words : List (Attribute Msg) -> String -> Html Msg
words attributes txt =
    node "words" attributes [ text txt ]
