module Main.Update exposing (update)

import Main.Message exposing (Msg(..))
import Main.Model exposing (Model)
import Main.Types exposing (Page(..))
import Api.PublicKey as PublicKey
import Ports
import Json.Encode as Encode
import SignIn.Update as SignIn
import User.Update as User
import Main.SetPage as SetPage
import Debug exposing (log)


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        SetPage page ->
            { model
                | page =
                    SetPage.handle page model.page
            }
                ! []

        GetServersPublicKey (Ok key) ->
            model ! []

        GetServersPublicKey (Err err) ->
            let
                _ =
                    log "ERROR" err
            in
                model ! [ PublicKey.get ]

        SignInWrapper signInMessage ->
            SignIn.update signInMessage model

        UserWrapper userMessage ->
            case model.page of
                UsersPage userModel ->
                    User.update userMessage userModel model

                _ ->
                    ( model, Cmd.none )
