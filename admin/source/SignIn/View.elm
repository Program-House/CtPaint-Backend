module SignIn.View exposing (view)

import Html exposing (Html, br)
import Html.Attributes exposing (class)
import Main.Message exposing (Msg(..))
import SignIn.Message exposing (SignInMsg(..))
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
