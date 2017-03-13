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


view : String -> Html Msg
view error =
    card
        [ class "solitary" ]
        [ vectorWords "Error"
        , words "Something went wrong.."
        , words error
        , button "Go home" True GoHome
        ]
