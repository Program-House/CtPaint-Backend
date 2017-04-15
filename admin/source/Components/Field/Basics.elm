module Components.Field.Basics exposing (..)

import Html exposing (Html, Attribute, node, input)
import Html.Attributes exposing (class)
import Main.Message exposing (Message(..))


container : String -> String -> Html Message -> Html Message
container extraClass labelText input =
    Html.div
        [ class ("field-container " ++ extraClass) ]
        [ label labelText
        , input
        ]


label : String -> Html Message
label str =
    node "field-label" [] [ Html.text str ]


field : List (Attribute Message) -> Html Message
field attributes =
    Html.input ((class "field") :: attributes) []
