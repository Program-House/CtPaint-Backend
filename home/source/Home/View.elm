module Home.View exposing (view)

import Html exposing (..)
import Main.Message exposing (Msg(..))
import Main.Components exposing (card, words)


view : Html Msg
view =
    words "dank"
