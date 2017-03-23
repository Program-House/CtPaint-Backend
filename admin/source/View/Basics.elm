module View.Basics exposing (..)

import Html exposing (Html, Attribute, node, text, div)
import Html.Attributes exposing (class)
import Main.Message exposing (Msg(..))


words : List (Attribute Msg) -> String -> Html Msg
words attributes txt =
    node "words" attributes [ text txt ]


card : List (Attribute Msg) -> List (Html Msg) -> Html Msg
card attributes children =
    node "card" attributes children


page : List (Html Msg) -> Html Msg
page =
    node "page" []


container : String -> String -> Html Msg -> Html Msg
container extraClass labelText input =
    div
        [ class ("field-container " ++ extraClass) ]
        [ label labelText
        , input
        ]


leftContainer : List (Html Msg) -> Html Msg
leftContainer =
    node "leftcontainer" []


label : String -> Html Msg
label str =
    node "fieldlabel" [] [ text str ]


field : List (Attribute Msg) -> Html Msg
field attributes =
    Html.input ((class "field") :: attributes) []
