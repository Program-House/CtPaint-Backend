module User.SearchBar.Components exposing (..)

import Html exposing (Html, node, input)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onInput, onClick)
import User.Message exposing (UserMessage(..))
import User.Model exposing (SearchParameter(..))
import Main.Message exposing (Message(..))
import View.Events exposing (ifEnter)
import View.Basics exposing (words)


parametersContainer : List (Html Message) -> Html Message
parametersContainer =
    node "parameters-container" []


options : List SearchParameter -> Html Message
options parameters =
    parameters
        |> List.map option
        |> node
            "drop-down-options-container"
            []


option : SearchParameter -> Html Message
option parameter =
    node "drop-down-option"
        [ parameter
            |> SetDropDown
            |> UserWrapper
            |> onClick
        ]
        [ dropDownWords parameter ]


dropDownWords : SearchParameter -> Html Message
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


dropDownButton : List (Html Message) -> Html Message
dropDownButton =
    node
        "drop-down-button"
        [ onClick
            (UserWrapper DropSearchParameters)
        ]


triangle : Html Message
triangle =
    node "triangle" [] []


searchBar : List (Html Message) -> Html Message
searchBar =
    node "search-bar-body" []
        >> List.singleton
        >> node "search-bar-container" []


field : String -> Html Message
field content =
    input
        [ class "field search"
        , value content
        , onInput (UserWrapper << UpdateSearchField)
        , ifEnter (UserWrapper << HandleEnter)
        ]
        []
