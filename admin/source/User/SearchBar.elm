module User.SearchBar exposing (view)

import Html exposing (Html, node)
import User.Model exposing (Model)
import Main.Message exposing (Msg(..))
import View.Basics exposing (words, label)
import User.SearchBar.Parameters as Parameters
import User.SearchBar.Components exposing (searchBar, field)


view : Model -> Html Msg
view model =
    searchBar
        [ label "search"
        , Parameters.view model
        , field model.searchField
        ]
