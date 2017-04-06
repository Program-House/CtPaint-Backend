module User.View exposing (view)

import Html exposing (Html, div)
import Main.Model exposing (Model)
import Main.Message exposing (Message(..))
import View.Basics as Basics
import User.Model as User
import User.Components exposing (separator, searchItems)
import User.SearchBar as SearchBar
import User.DetailsArea as DetailsArea


view : Model -> User.Model -> Html Message
view model userModel =
    Basics.page
        [ DetailsArea.view userModel
        , separator
        , SearchBar.view userModel
        , searchItems []
        ]
