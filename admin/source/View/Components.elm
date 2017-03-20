module View.Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, placeholder, value, type_)
import Html.Events exposing (onInput, onClick)
import Main.Message exposing (Msg(..))


words : List (Attribute Msg) -> String -> Html Msg
words attributes txt =
    node "words" attributes [ text txt ]


card : List (Attribute Msg) -> List (Html Msg) -> Html Msg
card attributes children =
    node "card" attributes children


field : String -> String -> String -> (String -> Msg) -> Html Msg
field labelText placeholder_ content msg =
    container labelText <|
        input
            [ class "field"
            , placeholder placeholder_
            , value content
            , onInput msg
            ]
            []


password : String -> String -> String -> (String -> Msg) -> Html Msg
password labelText placeholder_ content msg =
    container labelText <|
        input
            [ class "field"
            , placeholder placeholder_
            , value content
            , onInput msg
            , type_ "password"
            ]
            []


container : String -> Html Msg -> Html Msg
container labelText input_ =
    div
        [ class "field-container" ]
        [ label labelText
        , input_
        ]


label : String -> Html Msg
label str =
    node "fieldlabel" [] [ text str ]


button : String -> Bool -> Msg -> Html Msg
button label ready msg =
    input (buttonAttributes label ready msg) []


buttonAttributes : String -> Bool -> Msg -> List (Attribute Msg)
buttonAttributes label ready msg =
    if ready then
        [ class "button"
        , onClick msg
        , type_ "submit"
        , value label
        ]
    else
        [ class "button not-ready"
        , value label
        , type_ "submit"
        ]
