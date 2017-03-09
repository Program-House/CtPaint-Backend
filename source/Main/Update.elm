module Main.Update exposing (update)

import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import Main.Util as Util
import Navigation


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        UrlChange location ->
            if Util.isPossible location then
                { model
                    | location = location
                }
                    ! []
            else
                ( model, Navigation.newUrl "/" )

        GoHome ->
            ( model, Navigation.newUrl "/" )

        SignUp msg_ ->
            ( model, Cmd.none )
