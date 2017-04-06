module User.View exposing (view)

import Html exposing (Html)
import Main.Model exposing (Model)
import Main.Message exposing (Message(..))
import Components.Basics as Basics
import User.Model exposing (SearchParameter(..))
import User.Model as User
import User.Message exposing (UserMessage(..))
import User.Components as Components
import User.DetailsArea as DetailsArea
import Components.SearchBar as SearchBar


view : Model -> User.Model -> Html Message
view model userModel =
    Basics.page
        [ DetailsArea.view userModel
        , Components.separator
        , SearchBar.view
            userModel.searchParameterDropped
            (UserWrapper DropSearchParameters)
            [ ByEmail
            , ByUsername
            ]
            (UserWrapper << SetDropDown)
            userModel.searchParameter
            (UserWrapper << UpdateSearchField)
            (UserWrapper HandleEnter)
            userModel.searchField
        , Components.searchItems []
        ]
