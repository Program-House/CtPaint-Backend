module Components.DropDown.Basics
    exposing
        ( options
        , words
        , button
        , container
        )

import Html exposing (Html, node)
import Html.Events exposing (onInput, onClick)
import Html.Attributes exposing (class)
import Main.Message exposing (Message(..), Handler)
import View.Basics as Basics
import String.Extra


container : List (Html Message) -> Html Message
container =
    node "parameters-container" []


words : a -> Html Message
words parameter =
    parameter
        |> toString
        |> String.Extra.humanize
        |> String.toLower
        |> Basics.words [ class "drop-down" ]


options : Handler a -> List a -> Html Message
options handler parameters =
    parameters
        |> List.map (option handler)
        |> node
            "drop-down-options-container"
            []


option : Handler a -> a -> Html Message
option handler parameter =
    node "drop-down-option"
        [ onClick (handler parameter) ]
        [ words parameter ]


button : Message -> Html Message
button drop =
    node
        "drop-down-button"
        [ onClick drop ]
        [ node "triangle" [] [] ]
