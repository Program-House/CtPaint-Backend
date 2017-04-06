module Components.SearchBar.Basics exposing (searchBar, field)

import Html exposing (Html, node, input)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onInput)
import View.Events exposing (ifEnter)
import Main.Message exposing (Message(..), Handler)


searchBar : List (Html Message) -> Html Message
searchBar =
    node "search-bar-body" []
        >> List.singleton
        >> node "search-bar-container" []


field : Handler String -> Handler Bool -> String -> Html Message
field onInputMessage ifEnterMessage content =
    input
        [ class "field search"
        , value content
        , onInput onInputMessage
        , ifEnter ifEnterMessage
        ]
        []
