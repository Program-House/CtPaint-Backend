module Components.Basics exposing (..)

import Html exposing (Html, Attribute, node)
import Main.Message exposing (Message(..))


words : List (Attribute Message) -> String -> Html Message
words attributes txt =
    node "words" attributes [ Html.text txt ]


card : List (Attribute Message) -> List (Html Message) -> Html Message
card attributes children =
    node "card" attributes children


page : List (Html Message) -> Html Message
page =
    node "page" []


leftContainer : List (Html Message) -> Html Message
leftContainer =
    node "left-container" []


separator : Html Message
separator =
    node "separator" [] []


searchItems : List (Html Message) -> Html Message
searchItems =
    node "search-items" []
