module User.View exposing (view)

import Html exposing (Html)
import Main.Model exposing (Model)
import Main.Message exposing (Message(..))
import Components.Basics as Components
import User.Model exposing (SearchParameter(..))
import User.Model as User
import User.Message exposing (UserMessage(..))
import User.DetailsArea as DetailsArea
import Components.SearchBar as SearchBar


view : Model -> User.Model -> Html Message
view model userModel =
    Components.page
        [ DetailsArea.view userModel
        , Components.separator
        , SearchBar.view (toPayload userModel)
        , Components.searchItems []
        ]


toPayload : User.Model -> SearchBar.Payload SearchParameter
toPayload model =
    { dropped = model.searchParameterDropped
    , drop = UserWrapper DropSearchParameters
    , options =
        [ ByEmail
        , ByUsername
        ]
    , handleOptionSelect = UserWrapper << SetDropDown
    , selectedOption = model.searchParameter
    , onEnter = UserWrapper HandleEnter
    , onInput = UserWrapper << UpdateSearchField
    , searchField = model.searchField
    }
