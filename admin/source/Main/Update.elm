module Main.Update exposing (update)

import Main.Message exposing (Msg(..))
import Main.Model exposing (Model)
import Api.PublicKey as PublicKey
import Ports
import Api.SignIn exposing (signIn)
import SignIn.Handle as SignIn
import Json.Encode as Encode
import Debug exposing (log)


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        SetPage page ->
            { model
                | page = page
            }
                ! []

        GetPublicKey (Ok key) ->
            { model
                | publicKey = Just key
            }
                ! []

        GetPublicKey (Err err) ->
            let
                _ =
                    log "ERROR" err
            in
                { model
                    | publicKey = Nothing
                }
                    ! [ PublicKey.get ]

        GetSessionToken token ->
            { model
                | sessionToken = Just token
            }
                ! []

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

        GetEncryption cipher ->
            ( model, model.withEncryption cipher )
