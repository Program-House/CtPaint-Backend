module Components.Field exposing (view)

import Html exposing (Html, input)
import Html.Events exposing (onInput)
import Main.Message exposing (Message(..), Handler)
import Components.Field.Basics exposing (container)
import Html.Attributes
    exposing
        ( class
        , placeholder
        , value
        , type_
        , readonly
        , spellcheck
        )


view : String -> String -> String -> Bool -> Handler String -> Html Message
view labelText placeholder_ content disabled msg =
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
        container "user" labelText (input attributes [])
