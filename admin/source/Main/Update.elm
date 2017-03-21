module Main.Update exposing (update)

import Main.Message exposing (Msg(..))
import Main.Model exposing (Model)
import Api.PublicKey as PublicKey
import Ports
import Api.SignIn exposing (signIn)
import Json.Encode as Encode
import Debug exposing (log)


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case (log "MESSAGE" message) of
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

        GetSessionKey key ->
            { model
                | sessionKey = Just key
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
            case ( model.sessionKey, model.publicKey ) of
                ( Just sessionKey, Just publicKey ) ->
                    ( model
                    , Ports.encrypt
                        ( "Sign In"
                        , toRequest model sessionKey
                        , publicKey
                        )
                    )

                _ ->
                    ( model
                    , Cmd.batch
                        [ PublicKey.get
                        , Ports.requestSessionKey ()
                        ]
                    )

        SignInResult (Ok str) ->
            let
                _ =
                    log "RESULT" str
            in
                ( model, Cmd.none )

        SignInResult (Err err) ->
            ( model, Cmd.none )

        GetEncryption ( next, cipher ) ->
            case next of
                "Sign In" ->
                    ( model, signIn cipher )

                _ ->
                    ( model, Cmd.none )


toRequest : Model -> String -> String
toRequest model sessionKey =
    [ ( "username", Encode.string model.usernameField )
    , ( "password", Encode.string model.passwordField )
    , ( "sessionKey", Encode.string sessionKey )
    ]
        |> Encode.object
        |> Encode.encode 0



--, Ports.encrypt
--    ( "Register"
--    , toString model
--    , key
--    )
