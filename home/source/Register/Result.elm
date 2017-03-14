module Register.Result exposing (handle)

import Json.Decode exposing (Decoder)
import Json.Decode as Json
import Http
import Register.Model exposing (RegisterModel, Problem(..))
import Debug exposing (log)


handle : Result Http.Error Json.Value -> RegisterModel -> RegisterModel
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
            readJson body (showProblems model)


showProblems : RegisterModel -> RegisterModel
showProblems model =
    { model
        | showProblems = True
    }


getMsg : Decoder String
getMsg =
    Json.map identity (Json.field "msg" Json.string)


readJson : Json.Value -> RegisterModel -> RegisterModel
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


handleMsg : String -> RegisterModel -> RegisterModel
handleMsg msg model =
    case msg of
        "Email already exists" ->
            { model
                | problems = [ EmailAlreadyRegistered ]
                , showFields = True
            }

        "Successfully created user" ->
            { model
                | successfulRegistrationOccured = True
            }

        _ ->
            model
