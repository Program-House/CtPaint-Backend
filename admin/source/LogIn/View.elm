module LogIn.View exposing (view)

import Html exposing (Html, br)
import Html.Attributes exposing (class)
import Main.Message exposing (Msg(..))
import Main.Model exposing (Model)
import View.Components exposing (card, words, field, password, button)


view : Model -> Html Msg
view model =
    card
        [ class "solitary" ]
        [ words [] "Log In"
        , field
            "username"
            "username"
            model.usernameField
            UpdateUsernameField
        , password
            "password"
            "password"
            model.passwordField
            UpdatePasswordField
        , br [] []
        , button
            "Sign In"
            (ready model)
            SignIn
        ]


ready : Model -> Bool
ready { usernameField, passwordField } =
    usernameField /= "" && passwordField /= ""
