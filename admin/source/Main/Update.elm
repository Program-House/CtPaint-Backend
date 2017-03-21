module Main.Update exposing (update)

import Main.Message exposing (Msg(..))
import Main.Model exposing (Model)
import Api.PublicKey as PublicKey
import Ports
import Api.SignIn exposing (signIn)
import Json.Encode as Encode
import SignIn.Update as SignIn
import Debug exposing (log)


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        SetPage page ->
            { model
                | page = page
            }
                ! []

        GetServersPublicKey (Ok key) ->
            { model
                | serversPublicKey = Just key
            }
                ! []

        GetServersPublicKey (Err err) ->
            let
                _ =
                    log "ERROR" err
            in
                { model
                    | serversPublicKey = Nothing
                }
                    ! [ PublicKey.get ]

        GetSessionToken token ->
            { model
                | sessionToken = Just token
            }
                ! []

        GetEncryption cipher ->
            ( model, model.withEncryption cipher )

        SignInWrapper signInMessage ->
            SignIn.update model signInMessage
