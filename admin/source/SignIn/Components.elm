module SignIn.Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, placeholder, value, type_)
import Html.Events exposing (onInput, onClick, on, keyCode)
import Main.Message exposing (Msg(..))
import SignIn.Message exposing (SignInMsg(..))
import View.Basics as View
import View.Events exposing (ifEnter)
import Json.Decode as Json


field : String -> String -> String -> (String -> Msg) -> Html Msg
field labelText placeholder_ content msg =
    [ placeholder placeholder_
    , value content
    , onInput msg
    ]
        |> View.field
        |> View.container "sign-in" labelText


password : String -> String -> String -> (String -> Msg) -> Html Msg
password labelText placeholder_ content msg =
    [ placeholder placeholder_
    , value content
    , onInput msg
    , type_ "password"
    , ifEnter (SignInWrapper << HandleEnter)
    ]
        |> View.field
        |> View.container "sign-in" labelText


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
