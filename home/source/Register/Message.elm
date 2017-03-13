module Register.Message exposing (RegisterMsg(..))

import Http


type RegisterMsg
    = TryRegister
    | RegistrationResult (Result Http.Error String)
    | HandleEnter Bool
    | UpdateUserNameField String
    | UpdateFirstEmailField String
    | UpdateSecondEmailField String
    | UpdateFirstPasswordField String
    | UpdateSecondPasswordField String
