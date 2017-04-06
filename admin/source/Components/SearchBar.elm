module Components.SearchBar exposing (view)

import Html exposing (Html)
import Main.Message exposing (Message(..), Handler)
import User.Message exposing (UserMessage(..))
import Components.SearchBar.Basics exposing (searchBar, field)
import View.Basics exposing (label)
import Components.DropDown as DropDown


view : Bool -> Message -> List a -> Handler a -> a -> Handler String -> Handler Bool -> String -> Html Message
view dropped drop parameters onSelectDropDown currentParameter onInput ifEnter searchContent =
    searchBar
        [ label "search"
        , DropDown.view
            dropped
            drop
            onSelectDropDown
            currentParameter
            parameters
        , field
            onInput
            ifEnter
            searchContent
        ]
