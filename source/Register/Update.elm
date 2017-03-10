module Register.Update exposing (handle)

import Register.Message exposing (RegisterMsg(..))
import Register.Model exposing (RegisterModel)
import Main.Model exposing (Model, PageState(RegisterState))
import Main.Message exposing (Msg(..))
import Register.UserName as UserName
import Register.Valid as Valid


update : RegisterMsg -> RegisterModel -> ( RegisterModel, Cmd Msg )
update message model =
    case message of
        Register ->
            ( model, Cmd.none )

        CheckIfValid ->
            { model
                | problems = Valid.check model
            }
                ! []

        UpdateUserNameField str ->
            ( UserName.handle str model, Cmd.none )

        UpdateFirstEmailField str ->
            update CheckIfValid
                { model
                    | firstEmail = str
                }

        UpdateSecondEmailField str ->
            update CheckIfValid
                { model
                    | secondEmail = str
                }

        UpdateFirstPasswordField str ->
            update CheckIfValid
                { model
                    | firstPassword = str
                }

        UpdateSecondPasswordField str ->
            update CheckIfValid
                { model
                    | secondPassword = str
                }


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
