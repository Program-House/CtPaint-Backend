module Error.View exposing (view)

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
        [ class "solitary" ]
        [ vectorWords "Error"
        , words "Something went wrong"
        , button "Go home" True GoHome
        ]
