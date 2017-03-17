module Register.Try exposing (try)

import Register.Message exposing (RegisterMsg(..))
import Register.Model exposing (RegisterModel)
import Main.Model exposing (Model, PageState(RegisterState))
import Main.Message exposing (Msg(..))
import Json.Encode as Encode
import Json.Decode as Decode
import Http
import Main.Api as Api


try : RegisterModel -> ( PageState, Cmd Msg )
try model =
    if List.isEmpty model.problems then
        ( registrationPending model
        , submitRegistration model
        )
    else
        RegisterState { model | showProblems = True } ! []


registrationPending : RegisterModel -> PageState
registrationPending model =
    { model
        | showFields = False
        , registrationPending = True
    }
        |> RegisterState


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
