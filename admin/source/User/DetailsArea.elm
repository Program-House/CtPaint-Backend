module User.DetailsArea exposing (view)

import Html exposing (Html)
import Components.Basics as Basics
import Main.Message exposing (Message(..))
import User.Model exposing (Model)
import User.Message exposing (UserMessage(..))
import User.Components as Components


view : Model -> Html Message
view model =
    Basics.leftContainer
        [ emailLine model
        , Components.field
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
            Components.email "no user loaded"

        Just user ->
            Components.email "bonk"
