module User.View exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import View.Basics exposing (page, leftContainer, words)
import User.Model as User
import User.Message exposing (UserMsg(..))
import User.Components exposing (field, email, separator)
import User.SearchBar as SearchBar


view : Model -> User.Model -> Html Msg
view model userModel =
    page
        [ leftContainer
            [ emailLine userModel
            , field
                "username"
                "username"
                userModel.usernameField
                (userModel.current == Nothing)
                (UserWrapper << UpdateUsernameField)
            ]
        , separator
        , SearchBar.view userModel
        ]


emailLine : User.Model -> Html Msg
emailLine model =
    case model.current of
        Nothing ->
            email "no user loaded"

        Just user ->
            email "bonk"
