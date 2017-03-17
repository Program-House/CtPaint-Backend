module Register.Components
    exposing
        ( field
        , password
        , register
        , warning
        )

import Html exposing (node, div, input, text, Attribute, Html)
import Html.Attributes exposing (class, value, type_, placeholder)
import Html.Events exposing (onInput, onClick, keyCode, on)
import Main.Message exposing (Msg(..))
import Register.Message exposing (RegisterMsg(..))
import Register.Model exposing (Problem(..))
import Main.Components as Components
import Json.Decode as Json


field : String -> String -> String -> Bool -> (String -> Msg) -> Html Msg
field labelText placerholder_ fieldContent error msg =
    container labelText <|
        input
            [ fieldClass error
            , placeholder placerholder_
            , value fieldContent
            , onInput msg
            ]
            []


fieldClass : Bool -> Attribute Msg
fieldClass error =
    if error then
        class "register-field error"
    else
        class "register-field"


password : String -> String -> String -> Bool -> (String -> Msg) -> Html Msg
password labelText placerholder_ fieldContent error msg =
    container labelText <|
        input
            [ fieldClass error
            , placeholder placerholder_
            , type_ "password"
            , value fieldContent
            , onInput msg
            , ifEnter (RegisterWrapper << HandleEnter)
            ]
            []


warning : String -> Html Msg
warning =
    Components.warning "registration"


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


register : Bool -> Html Msg
register ready =
    let
        attr =
            buttonAttributes
                "Register"
                ready
                (RegisterWrapper TryRegister)
    in
        input attr []


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


ifEnter : (Bool -> Msg) -> Attribute Msg
ifEnter msg =
    on "keydown" <| Json.map (msg << (==) 13) keyCode
