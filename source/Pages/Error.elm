module Pages.Error exposing (view)

import Html exposing (Html, br)
import Html.Attributes exposing (class, style)
import Main.Message exposing (Msg(..))
import Main.Components
    exposing
        ( card
        , words
        , vectorWords
        , button
        )


view : Html Msg
view =
    card
        [ class "error-solitary" ]
        [ vectorWords "Sorry"
          --, br [] []
          --, br [] []
        , words "This page doesnt exist"
          --, br [] []
          --, br [] []
        , button "Go home" True GoHome
        ]
