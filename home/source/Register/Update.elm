module Register.Update exposing (handle)

import Register.Message exposing (RegisterMsg(..))
import Register.Model exposing (RegisterModel)
import Main.Model exposing (Model, PageState(RegisterState))
import Main.Message exposing (Msg)
import Register.Try as Register
import Register.Result as Result
import Register.Problems as Problems


update : RegisterMsg -> RegisterModel -> ( PageState, Cmd Msg )
update message model =
    case message of
        TryRegister ->
            (Register.try (Problems.set model))

        RegistrationResult result ->
            ( Result.handle result model, Cmd.none )

        HandleEnter isEnter ->
            if isEnter then
                update TryRegister model
            else
                ( RegisterState model, Cmd.none )

        UpdateUserNameField str ->
            pack { model | username = str }

        UpdateFirstEmailField str ->
            pack { model | firstEmail = str }

        UpdateSecondEmailField str ->
            pack { model | secondEmail = str }

        UpdateFirstPasswordField str ->
            pack { model | firstPassword = str }

        UpdateSecondPasswordField str ->
            pack { model | secondPassword = str }


pack : RegisterModel -> ( PageState, Cmd Msg )
pack model =
    RegisterState model ! []


incorporatePageState : Model -> ( PageState, Cmd Msg ) -> ( Model, Cmd Msg )
incorporatePageState model ( pageState, cmd ) =
    ( { model | pageState = pageState }, cmd )


handle : Model -> RegisterMsg -> RegisterModel -> ( Model, Cmd Msg )
handle model msg registerModel =
    incorporatePageState model (update msg registerModel)
