module SignIn.Update exposing (update)

import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import SignIn.Message exposing (SignInMsg(..))
import Ports
import Json.Decode as Json


update : SignInMsg -> Model -> ( Model, Cmd Msg )
update signInMessage model =
    case signInMessage of
        UpdateUsernameField str ->
            { model
                | usernameField = str
            }
                ! []

        UpdatePasswordField str ->
            { model
                | passwordField = str
            }
                ! []

        SignIn ->
            ( model, Cmd.none )

        HandleEnter True ->
            update SignIn model

        HandleEnter False ->
            ( model, Cmd.none )
