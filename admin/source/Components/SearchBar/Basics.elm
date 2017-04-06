module Components.SearchBar.Basics exposing (searchBar, field)

import Html exposing (Html, node, input)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onInput)
import Html.Events.Extra exposing (onEnter)
import Main.Message exposing (Message(..), Handler)


searchBar : List (Html Message) -> Html Message
searchBar =
    node "search-bar-body" []
        >> List.singleton
        >> node "search-bar-container" []


field : Handler String -> Message -> String -> Html Message
field onInputHandler onEnterMessage content =
    input
        [ class "field search"
        , value content
        , onInput onInputHandler
        , onEnter onEnterMessage
        ]
        []
