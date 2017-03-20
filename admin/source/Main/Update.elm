module Main.Update exposing (update)

import Main.Message exposing (Msg(..))
import Main.Model exposing (Model)
import Api.PublicKey as PublicKey
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
            { model
                | publicKey = Nothing
            }
                ! [ PublicKey.get ]

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
