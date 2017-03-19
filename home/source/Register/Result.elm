module Register.Result exposing (handle)

import Json.Decode exposing (Decoder)
import Json.Decode as Json
import Http
import Register.Model exposing (RegisterModel, Problem(..))
import Main.Model exposing (PageState(..))
import Debug exposing (log)


handle : Result Http.Error Json.Value -> RegisterModel -> PageState
handle result model =
    case result of
        Err err ->
            let
                _ =
                    log "Http error is" err
            in
                { model
                    | problems = [ ConnectionFailure ]
                }
                    |> showProblems

        Ok body ->
            readJson body model


showProblems : RegisterModel -> PageState
showProblems model =
    { model
        | showProblems = True
    }
        |> RegisterState


getMsg : Decoder String
getMsg =
    Json.map identity (Json.field "msg" Json.string)


readJson : Json.Value -> RegisterModel -> PageState
readJson json model =
    case Json.decodeValue getMsg json of
        Ok msg ->
            handleMsg msg model

        Err err ->
            let
                _ =
                    log "Json decode error" err
            in
                { model
                    | problems = [ ConnectionFailure ]
                }
                    |> RegisterState


handleMsg : String -> RegisterModel -> PageState
handleMsg msg model =
    case msg of
        "Email already exists" ->
            { model
                | problems = [ EmailAlreadyRegistered ]
                , showFields = True
            }
                |> showProblems

        "Successfully created user" ->
            SuccessfulRegisterState model.firstEmail

        _ ->
            RegisterState model
