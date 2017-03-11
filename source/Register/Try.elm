module Register.Try exposing (try)

import Register.Message exposing (RegisterMsg(..))
import Register.Model exposing (RegisterModel)
import Main.Model exposing (Model, PageState(RegisterState))
import Main.Message exposing (Msg(..))
import Register.Valid as Valid
import Debug exposing (log)


try : RegisterModel -> ( RegisterModel, Cmd Msg )
try model =
    if List.isEmpty model.problems then
        log "ayy we register now" ( model, Cmd.none )
    else
        { model
            | showProblems = True
        }
            ! []
