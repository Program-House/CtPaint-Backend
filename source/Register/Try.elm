module Register.Try exposing (try)

import Register.Message exposing (RegisterMsg(..))
import Register.Model exposing (RegisterModel)
import Main.Model exposing (Model, PageState(RegisterState))
import Main.Message exposing (Msg(..))
import Json.Encode as Encode
import Json.Decode as Decode
import Http
import Debug exposing (log)


try : RegisterModel -> ( RegisterModel, Cmd Msg )
try model =
    if List.isEmpty model.problems then
        ( model, register model )
    else
        { model
            | showProblems = True
        }
            ! []


register : RegisterModel -> Cmd Msg
register model =
    Http.post
        "http://localhost:2984/api/register"
        (Http.jsonBody <| toJson model)
        (Decode.string)
        |> Http.send (RegisterWrapper << RegistrationResult)


toJson : RegisterModel -> Encode.Value
toJson model =
    Encode.object
        [ ( "username", Encode.string model.username )
        , ( "email", Encode.string model.firstEmail )
        , ( "password", Encode.string model.firstPassword )
        ]
