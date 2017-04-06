module User.Components exposing (..)

import Html exposing (..)
import Html.Events exposing (onInput, onClick, on, keyCode)
import Main.Message exposing (Message(..))
import SignIn.Message exposing (SignInMessage(..))
import Components.Basics as View
import Json.Decode as Json
import Html.Attributes
    exposing
        ( class
        , placeholder
        , value
        , type_
        , readonly
        , spellcheck
        )


searchItems : List (Html Message) -> Html Message
searchItems =
    node "search-items" []


email : String -> Html Message
email str =
    View.container "" str (Html.text "")


field : String -> String -> String -> Bool -> (String -> Message) -> Html Message
field labelText placeholder_ content disabled msg =
    let
        attributes =
            if disabled then
                [ class "field disabled"
                , value "username"
                , readonly True
                , placeholder placeholder_
                , spellcheck False
                ]
            else
                [ class "field"
                , onInput msg
                , value content
                , placeholder placeholder_
                , spellcheck False
                ]
    in
        View.container "user" labelText (input attributes [])


separator : Html Message
separator =
    node "separator" [] []
