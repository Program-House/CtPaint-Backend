module Main.Update exposing (update)

import Main.Model exposing (Model, PageState(..))
import Main.Message exposing (Msg(..))
import Register.Message exposing (RegisterMsg(..))
import Register.Update as Register
import Main.Router as Router
import Navigation
import Main.Auth as Auth
import Debug exposing (log)


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        UrlChange location ->
            Router.handle location model

        GoHome ->
            ( model, Navigation.newUrl "/" )

        RegisterWrapper registerMsg ->
            case model.pageState of
                RegisterState registerModel ->
                    Register.handle
                        registerMsg
                        model
                        registerModel

                _ ->
                    ( model, Cmd.none )

        GetPublicKey next (Ok key) ->
            { model
                | publicKey = Just key
            }
                ! [ next key ]

        GetPublicKey next (Err err) ->
            { model
                | publicKey = Nothing
            }
                ! [ Auth.getPublicKey next ]

        GetEncryption ( next, cipherText ) ->
            case next of
                "Register" ->
                    case model.pageState of
                        RegisterState registerModel ->
                            Register.handle
                                (SubmitRegistration cipherText)
                                model
                                registerModel

                        _ ->
                            ( model, Cmd.none )

                _ ->
                    ( model, Cmd.none )
