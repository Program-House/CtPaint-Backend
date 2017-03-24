module User.SearchBar.Components
    exposing
        ( parametersContainer
        , dropDownButton
        , triangle
        , searchBar
        , field
        )

import Html exposing (Html, node, input)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onInput)
import User.Message exposing (UserMsg(..))
import Main.Message exposing (Msg(..))
import Main.Message exposing (Msg(..))
import View.Events exposing (ifEnter)


parametersContainer : List (Html Msg) -> Html Msg
parametersContainer =
    node "parameters-container" []


dropDownButton : List (Html Msg) -> Html Msg
dropDownButton =
    node "drop-down-button" []


triangle : Html Msg
triangle =
    node "triangle" [] []


searchBar : List (Html Msg) -> Html Msg
searchBar =
    node "search-bar-body" []
        >> List.singleton
        >> node "search-bar-container" []


field : String -> Html Msg
field content =
    input
        [ class "field search"
        , value content
        , onInput (UserWrapper << UpdateSearchField)
        , ifEnter (UserWrapper << HandleEnter)
        ]
        []
