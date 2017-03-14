module Register.Update exposing (handle)

import Register.Message exposing (RegisterMsg(..))
import Register.Model exposing (RegisterModel)
import Main.Model exposing (Model, PageState(RegisterState))
import Main.Message exposing (Msg(..))
import Register.Try as Register
import Register.Result as Result
import Register.Problems as Problems
import Debug exposing (log)


update : RegisterMsg -> RegisterModel -> ( RegisterModel, Cmd Msg )
update message model =
    case message of
        TryRegister ->
            Register.try (Problems.set model)

        RegistrationResult result ->
            ( Result.handle result model, Cmd.none )

        HandleEnter isEnter ->
            if isEnter then
                update TryRegister model
            else
                ( model, Cmd.none )

        UpdateUserNameField str ->
            { model
                | username = str
            }
                ! []

        UpdateFirstEmailField str ->
            { model
                | firstEmail = str
            }
                ! []

        UpdateSecondEmailField str ->
            { model
                | secondEmail = str
            }
                ! []

        UpdateFirstPasswordField str ->
            { model
                | firstPassword = str
            }
                ! []

        UpdateSecondPasswordField str ->
            { model
                | secondPassword = str
            }
                ! []


incorporate : Model -> ( RegisterModel, Cmd Msg ) -> ( Model, Cmd Msg )
incorporate model ( registerModel, cmd ) =
    ( { model
        | pageState = RegisterState registerModel
      }
    , cmd
    )


handle : Model -> RegisterMsg -> RegisterModel -> ( Model, Cmd Msg )
handle model msg registerModel =
    registerModel
        |> update msg
        |> incorporate model
