module Register.Message exposing (RegisterMsg(..))


type RegisterMsg
    = TryRegister
    | HandleEnter Bool
    | UpdateUserNameField String
    | UpdateFirstEmailField String
    | UpdateSecondEmailField String
    | UpdateFirstPasswordField String
    | UpdateSecondPasswordField String
