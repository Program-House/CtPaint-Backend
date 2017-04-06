module User.DetailsArea exposing (view)

import Html exposing (Html)
import View.Basics exposing (leftContainer)
import Main.Message exposing (Message(..))
import User.Model exposing (Model)
import User.Message exposing (UserMessage(..))
import User.Components exposing (field, email)


view : Model -> Html Message
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


emailLine : Model -> Html Message
emailLine model =
    case model.current of
        Nothing ->
            email "no user loaded"

        Just user ->
            email "bonk"
