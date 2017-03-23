module User.View exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import User.Model as User
import View.Basics exposing (page, leftContainer)
import User.Message exposing (UserMsg(..))
import User.Components exposing (field)


view : Model -> User.Model -> Html Msg
view model userModel =
    page
        [ leftContainer
            [ field
                "username"
                "username"
                ""
                (UserWrapper << UpdateUsernameField)
            ]
        ]
