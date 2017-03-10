module Register.Components exposing (field, password, button)

import Html exposing (node, div, input, text, Attribute, Html)
import Html.Attributes exposing (class, value, type_, placeholder)
import Html.Events exposing (onInput)
import Main.Message exposing (Msg(..))
import Main.Components as Components
import Register.Message exposing (RegisterMsg(..))
import Register.Model exposing (Problem(..))


field : String -> String -> String -> (String -> Msg) -> Html Msg
field labelText placerholder_ fieldContent msg =
    container labelText <|
        input
            [ class "register-field"
            , placeholder placerholder_
            , value fieldContent
            , onInput msg
            ]
            []


password : String -> String -> String -> (String -> Msg) -> Html Msg
password labelText placerholder_ fieldContent msg =
    container labelText <|
        input
            [ class "register-field"
            , placeholder placerholder_
            , type_ "password"
            , value fieldContent
            , onInput msg
            ]
            []


container : String -> Html Msg -> Html Msg
container labelText input_ =
    div
        [ class "register-field-container" ]
        [ label labelText
        , input_
        ]


label : String -> Html Msg
label str =
    node "fieldlabel" [] [ text str ]


button : List Problem -> Html Msg
button problems =
    Components.button
        "Register"
        (List.isEmpty problems)
        (RegisterWrapper Register)
