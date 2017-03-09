module Main.Update exposing (update)

import Main.Model exposing (Model, PageState(..))
import Main.Message exposing (Msg(..))
import Register.Update as Register
import Main.Url as Url
import Navigation


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        UrlChange location ->
            Url.handle location model

        --if Util.isPossible location then
        --    { model
        --        | location = location
        --    }
        --        ! []
        --else
        --    ( model, Navigation.newUrl "/" )
        GoHome ->
            ( model, Navigation.newUrl "/" )

        RegisterWrapper registerMsg ->
            case model.pageState of
                RegisterState registerModel ->
                    registerModel
                        |> Register.update registerMsg
                        |> Register.incorporate model

                _ ->
                    ( model, Cmd.none )
