module SignIn.Update exposing (update)

import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import SignIn.Message exposing (SignInMsg(..))
import SignIn.Handle as SignIn
import Api.SignIn exposing (signIn)
import Ports
import Json.Decode as Json
import SignIn.Result as Result


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
            { model
                | withEncryption = signIn
            }
                |> SignIn.handle

        SignInResult (Ok json) ->
            Result.handle json model

        SignInPlaintext json ->
            Result.plaintext json model

        --( model, Cmd.none )
        SignInResult (Err err) ->
            ( model, Cmd.none )

        HandleEnter True ->
            update SignIn model

        HandleEnter False ->
            ( model, Cmd.none )
