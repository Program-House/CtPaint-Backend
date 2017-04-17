module User.DetailsArea exposing (view)

import Html exposing (Html)
import Components.Basics as Components
import Components.Field as Field
import Components.Field.Basics exposing (container)
import Main.Message exposing (Message(..))
import User.Model exposing (Model)
import User.Message exposing (UserMessage(..))


view : Model -> Html Message
view model =
    Components.leftContainer
        [ emailLine model
        , Field.view
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


email : String -> Html Message
email str =
    container "" str (Html.text "")
