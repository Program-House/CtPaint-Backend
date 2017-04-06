module Components.SearchBar exposing (view, Payload)

import Html exposing (Html)
import Main.Message exposing (Message(..), Handler)
import User.Message exposing (UserMessage(..))
import Components.SearchBar.Basics exposing (searchBar, field)
import Components.Basics exposing (label)
import Components.DropDown as DropDown


type alias Payload a =
    { dropped : Bool
    , drop : Message
    , options : List a
    , handleOptionSelect : Handler a
    , selectedOption : a
    , onEnter : Message
    , onInput : Handler String
    , searchField : String
    }


view : Payload a -> Html Message
view p =
    searchBar
        [ label "search"
        , DropDown.view
            p.dropped
            p.drop
            p.handleOptionSelect
            p.selectedOption
            p.options
        , field
            p.onInput
            p.onEnter
            p.searchField
        ]
