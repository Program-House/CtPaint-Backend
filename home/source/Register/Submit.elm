module Register.Submit exposing (begin, submit)

import Register.Message exposing (RegisterMsg(..))
import Register.Model exposing (RegisterModel)
import Main.Model exposing (Model, PageState(RegisterState))
import Main.Message exposing (Msg(..))
import Json.Encode as Encode
import Json.Decode as Decode
import Http
import Main.Api as Api
import Main.Auth as Auth
import Ports


submit : String -> RegisterModel -> ( PageState, Cmd Msg )
submit cipher model =
    ( RegisterState model
    , submitRegistration cipher
    )


begin : Maybe String -> RegisterModel -> ( PageState, Cmd Msg )
begin publicKey model =
    if List.isEmpty model.problems then
        case publicKey of
            Just key ->
                ( registrationPending model
                , Ports.encrypt
                    ( "Register"
                    , toString model
                    , key
                    )
                )

            Nothing ->
                ( registrationPending model
                , Auth.getPublicKey (thenRegister model)
                )
    else
        RegisterState { model | showProblems = True } ! []


thenRegister : RegisterModel -> (String -> Cmd Msg)
thenRegister model =
    (,,) "Register" (toString model) >> Ports.encrypt


registrationPending : RegisterModel -> PageState
registrationPending model =
    { model
        | showFields = False
        , registrationPending = True
    }
        |> RegisterState


submitRegistration : String -> Cmd Msg
submitRegistration cipher =
    Http.send
        (RegisterWrapper << RegistrationResult)
        (post cipher)


post : String -> Http.Request Decode.Value
post cipher =
    Http.post
        (Api.root "/api/register")
        (toBody cipher)
        Decode.value


toBody : String -> Http.Body
toBody cipher =
    (Http.jsonBody << Encode.object)
        [ ( "cipher", Encode.string cipher ) ]


toString : RegisterModel -> String
toString model =
    [ ( "username", Encode.string model.username )
    , ( "email", Encode.string model.firstEmail )
    , ( "password", Encode.string model.firstPassword )
    ]
        |> Encode.object
        |> Encode.encode 0
