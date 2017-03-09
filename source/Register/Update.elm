module Register.Update exposing (update, incorporate)

import Register.Message exposing (RegisterMsg(..))
import Register.Model exposing (RegisterModel)
import Main.Model exposing (Model, PageState(RegisterState))
import Main.Message exposing (Msg(..))


update : RegisterMsg -> RegisterModel -> ( RegisterModel, Cmd Msg )
update message model =
    case message of
        Register ->
            ( model, Cmd.none )

        CheckIfValid ->
            ( model, Cmd.none )


incorporate : Model -> ( RegisterModel, Cmd Msg ) -> ( Model, Cmd Msg )
incorporate model ( registerModel, cmd ) =
    ( incorporateModel registerModel model, cmd )


incorporateModel : RegisterModel -> Model -> Model
incorporateModel registerModel model =
    { model
        | pageState = RegisterState registerModel
    }
