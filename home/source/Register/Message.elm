module Register.Message exposing (RegisterMsg(..))

import Http
import Json.Decode as Json


type RegisterMsg
    = BeginRegister
    | SubmitRegistration String
    | RegistrationResult (Result Http.Error Json.Value)
    | HandleEnter Bool
    | UpdateUserNameField String
    | UpdateFirstEmailField String
    | UpdateSecondEmailField String
    | UpdateFirstPasswordField String
    | UpdateSecondPasswordField String
