module View.Basics exposing (..)

import Html exposing (Html, Attribute, node, text, div)
import Html.Attributes exposing (class)
import Main.Message exposing (Message(..))


words : List (Attribute Message) -> String -> Html Message
words attributes txt =
    node "words" attributes [ text txt ]


card : List (Attribute Message) -> List (Html Message) -> Html Message
card attributes children =
    node "card" attributes children


page : List (Html Message) -> Html Message
page =
    node "page" []


container : String -> String -> Html Message -> Html Message
container extraClass labelText input =
    div
        [ class ("field-container " ++ extraClass) ]
        [ label labelText
        , input
        ]


leftContainer : List (Html Message) -> Html Message
leftContainer =
    node "left-container" []


label : String -> Html Message
label str =
    node "field-label" [] [ text str ]


field : List (Attribute Message) -> Html Message
field attributes =
    Html.input ((class "field") :: attributes) []
