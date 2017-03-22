module SignIn.Result exposing (handle, plaintext)

import Main.Message exposing (Msg(..))
import Main.Model exposing (Model)
import SignIn.Message exposing (SignInMsg(..))
import Json.Decode as Json
import Debug exposing (log)
import Ports


handle : Json.Value -> Model -> ( Model, Cmd Msg )
handle json model =
    let
        cipher =
            Json.decodeValue
                (Json.field "cipher" Json.string)
                json
    in
        case cipher of
            Ok str ->
                { model
                    | withPlaintext =
                        Just (SignInWrapper << SignInPlaintext)
                }
                    ! [ Ports.decrypt str ]

            Err err ->
                let
                    _ =
                        log "ERROR" err
                in
                    ( model, Cmd.none )


plaintext : String -> Model -> ( Model, Cmd Msg )
plaintext json model =
    let
        result =
            Json.decodeString
                (Json.field "msg" Json.string)
                json
    in
        case result of
            Ok msg ->
                case msg of
                    "Success" ->
                        { model
                            | loggedIn = True
                        }
                            ! []

                    _ ->
                        ( model, Cmd.none )

            Err err ->
                ( model, Cmd.none )
