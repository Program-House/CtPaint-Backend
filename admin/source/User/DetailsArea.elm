module User.DetailsArea exposing (view)

import Html exposing (Html)
import View.Basics exposing (leftContainer)
import Main.Message exposing (Msg(..))
import User.Model exposing (Model)
import User.Message exposing (UserMsg(..))
import User.Components exposing (field, email)


view : Model -> Html Msg
view model =
    leftContainer
        [ emailLine model
        , field
            "username"
            "username"
            model.usernameField
            (model.current == Nothing)
            (UserWrapper << UpdateUsernameField)
        ]


emailLine : Model -> Html Msg
emailLine model =
    case model.current of
        Nothing ->
            email "no user loaded"

        Just user ->
            email "bonk"
