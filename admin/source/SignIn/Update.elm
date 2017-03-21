module SignIn.Update exposing (update)

import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import SignIn.Message exposing (SignInMsg(..))
import SignIn.Handle as SignIn
import Api.SignIn exposing (signIn)
import Debug exposing (log)


update : Model -> SignInMsg -> ( Model, Cmd Msg )
update model signInMessage =
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

        SignInResult (Ok str) ->
            let
                _ =
                    log "RESULT" str
            in
                ( model, Cmd.none )

        SignInResult (Err err) ->
            ( model, Cmd.none )
