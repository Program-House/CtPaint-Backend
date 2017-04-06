module SignIn.View exposing (view)

import Html exposing (Html, br)
import Html.Attributes exposing (class)
import Main.Message exposing (Message(..))
import SignIn.Message exposing (SignInMessage(..))
import SignIn.Model exposing (Model)
import SignIn.Components exposing (field, password, button)
import Components.Basics exposing (card, words)


view : Model -> Html Message
view model =
    card
        [ class "solitary" ]
        [ words [] "Log In"
        , field
            "username"
            "username"
            model.usernameField
            (SignInWrapper << UpdateUsernameField)
        , password
            "password"
            "password"
            model.passwordField
            (SignInWrapper << UpdatePasswordField)
        , br [] []
        , button
            "Sign In"
            (ready model)
            (SignInWrapper SignIn)
        ]


ready : Model -> Bool
ready { usernameField, passwordField } =
    usernameField /= "" && passwordField /= ""
