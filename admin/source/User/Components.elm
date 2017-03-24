module User.Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, placeholder, value, type_, readonly)
import Html.Events exposing (onInput, onClick, on, keyCode)
import Main.Message exposing (Msg(..))
import SignIn.Message exposing (SignInMsg(..))
import View.Basics as View
import View.Events exposing (ifEnter)
import Json.Decode as Json


email : String -> Html Msg
email str =
    View.container "" str (Html.text "")


field : String -> String -> String -> Bool -> (String -> Msg) -> Html Msg
field labelText placeholder_ content disabled msg =
    let
        attributes =
            if disabled then
                [ class "field disabled"
                , value "username"
                , readonly True
                , placeholder placeholder_
                ]
            else
                [ class "field"
                , onInput msg
                , value content
                , placeholder placeholder_
                ]
    in
        View.container "user" labelText (input attributes [])


separator : Html Msg
separator =
    node "separator" [] []
