module Pages.Error exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Main.Message exposing (Msg(..))
import Main.Components exposing (card)


view : Html Msg
view =
    card
        []
        [ p [] [ text "ERROR!" ] ]
