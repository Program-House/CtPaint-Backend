module SignIn.Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, placeholder, value, type_)
import Html.Events exposing (onInput, onClick)
import Main.Message exposing (Message(..))
import SignIn.Message exposing (SignInMessage(..))
import Components.Field.Basics as Components
import Html.Events.Extra exposing (onEnter)


field : String -> String -> String -> (String -> Message) -> Html Message
field labelText placeholder_ content msg =
    [ placeholder placeholder_
    , value content
    , onInput msg
    ]
        |> Components.field
        |> Components.container "sign-in" labelText


password : String -> String -> String -> (String -> Message) -> Html Message
password labelText placeholder_ content msg =
    [ placeholder placeholder_
    , value content
    , onInput msg
    , type_ "password"
    , onEnter (SignInWrapper HandleEnter)
    ]
        |> Components.field
        |> Components.container "sign-in" labelText


button : String -> Bool -> Message -> Html Message
button label ready msg =
    input (buttonAttributes label ready msg) []


buttonAttributes : String -> Bool -> Message -> List (Attribute Message)
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
