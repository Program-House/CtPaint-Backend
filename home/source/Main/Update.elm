module Main.Update exposing (update)

import Main.Model exposing (Model, PageState(..))
import Main.Message exposing (Msg(..))
import Register.Update as Register
import Main.Url as Url
import Navigation
import Debug


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        UrlChange location ->
            Url.handle location model

        GoHome ->
            ( model, Navigation.newUrl "/" )

        RegisterWrapper registerMsg ->
            case model.pageState of
                RegisterState registerModel ->
                    Register.handle
                        model
                        registerMsg
                        registerModel

                _ ->
                    ( model, Cmd.none )
