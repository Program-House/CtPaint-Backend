module Register.Update exposing (handle)

import Register.Message exposing (RegisterMsg(..))
import Register.Model exposing (RegisterModel)
import Main.Model exposing (Model, PageState(RegisterState))
import Main.Message exposing (Msg)
import Register.Submit as Submit
import Register.Result as Result
import Register.Problems as Problems


update : RegisterMsg -> RegisterModel -> Maybe String -> ( PageState, Cmd Msg )
update message model publicKey =
    case message of
        BeginRegister ->
            Submit.begin publicKey (Problems.set model)

        SubmitRegistration cipher ->
            Submit.submit cipher model

        RegistrationResult result ->
            ( Result.handle result model, Cmd.none )

        HandleEnter isEnter ->
            if isEnter then
                update BeginRegister model publicKey
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


handle : RegisterMsg -> Model -> RegisterModel -> ( Model, Cmd Msg )
handle msg model registerModel =
    incorporatePageState
        model
        (update msg registerModel model.publicKey)
