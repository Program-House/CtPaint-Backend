module User.SearchBar.Components exposing (..)

import Html exposing (Html, node, input)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onInput, onClick)
import User.Message exposing (UserMsg(..))
import User.Model exposing (SearchParameter(..))
import Main.Message exposing (Msg(..))
import View.Events exposing (ifEnter)
import View.Basics exposing (words)


parametersContainer : List (Html Msg) -> Html Msg
parametersContainer =
    node "parameters-container" []


options : List SearchParameter -> Html Msg
options parameters =
    parameters
        |> List.map option
        |> node
            "drop-down-options-container"
            []


option : SearchParameter -> Html Msg
option parameter =
    node "drop-down-option"
        [ parameter
            |> SetDropDown
            |> UserWrapper
            |> onClick
        ]
        [ dropDownWords parameter ]


dropDownWords : SearchParameter -> Html Msg
dropDownWords parameter =
    words
        [ class "drop-down" ]
        (fromParameter parameter)


fromParameter : SearchParameter -> String
fromParameter parameter =
    case parameter of
        ByEmail ->
            "by email"

        ByUsername ->
            "by username"


dropDownButton : List (Html Msg) -> Html Msg
dropDownButton =
    node
        "drop-down-button"
        [ onClick
            (UserWrapper DropSearchParameters)
        ]


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
