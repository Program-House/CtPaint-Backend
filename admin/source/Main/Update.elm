module Main.Update exposing (update)

import Main.Message exposing (Message(..))
import Main.Model exposing (Model)
import Main.Types exposing (Page(..))
import Api.PublicKey as PublicKey
import Ports
import Json.Encode as Encode
import SignIn.Update as SignIn
import User.Update as User
import User.Model
import Main.SetPage as SetPage
import Ports
import Debug exposing (log)


update : Message -> Model -> ( Model, Cmd Message )
update message model =
    case message of
        SetPage page ->
            { model
                | page =
                    SetPage.handle page model.page
            }
                ! []

        GetServersPublicKey (Ok key) ->
            model ! [ Ports.saveServersKey key ]

        GetServersPublicKey (Err err) ->
            let
                _ =
                    log "ERROR" err
            in
                model ! [ PublicKey.get ]

        SignInWrapper signInMessage ->
            case model.page of
                SignInPage signInModel ->
                    SignIn.update signInMessage signInModel model

                _ ->
                    ( model, Cmd.none )

        SignInResult username ->
            { model
                | page = UsersPage User.Model.init
            }
                ! [ Ports.setUsername username ]

        UserWrapper userMessage ->
            case model.page of
                UsersPage userModel ->
                    User.update userMessage userModel model

                _ ->
                    ( model, Cmd.none )
