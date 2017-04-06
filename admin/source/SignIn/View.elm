module SignIn.View exposing (view)

import Html exposing (Html, br)
import Html.Attributes exposing (class)
import Main.Message exposing (Message(..))
import SignIn.Message exposing (SignInMessage(..))
import SignIn.Model exposing (Model)
import SignIn.Components as Components
import Components.Basics as Basics


view : Model -> Html Message
view model =
    Basics.card
        [ class "solitary" ]
        [ Basics.words [] "Log In"
        , Components.field
            "username"
            "username"
            model.usernameField
            (SignInWrapper << UpdateUsernameField)
        , Components.password
            "password"
            "password"
            model.passwordField
            (SignInWrapper << UpdatePasswordField)
        , br [] []
        , Components.button
            "Sign In"
            (ready model)
            (SignInWrapper SignIn)
        ]


ready : Model -> Bool
ready { usernameField, passwordField } =
    usernameField /= "" && passwordField /= ""
