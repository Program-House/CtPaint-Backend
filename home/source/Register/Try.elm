module Register.Try exposing (try)

import Register.Message exposing (RegisterMsg(..))
import Register.Model exposing (RegisterModel)
import Main.Model exposing (Model, PageState(RegisterState))
import Main.Message exposing (Msg(..))
import Json.Encode as Encode
import Json.Decode as Decode
import Http
import Main.Api as Api
import Debug exposing (log)


try : RegisterModel -> ( RegisterModel, Cmd Msg )
try model =
    if List.isEmpty model.problems then
        { model
            | showFields = False
        }
            ! [ submitRegistration model ]
    else
        { model
            | showProblems = True
        }
            ! []


submitRegistration : RegisterModel -> Cmd Msg
submitRegistration model =
    Http.send
        (RegisterWrapper << RegistrationResult)
        (post model)


post : RegisterModel -> Http.Request Decode.Value
post model =
    Http.post
        (Api.root "/api/register")
        (Http.jsonBody <| toJson model)
        Decode.value


toJson : RegisterModel -> Encode.Value
toJson model =
    Encode.object
        [ ( "username", Encode.string model.username )
        , ( "email", Encode.string model.firstEmail )
        , ( "password", Encode.string model.firstPassword )
        ]
