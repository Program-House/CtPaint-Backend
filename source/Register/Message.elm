module Register.Message exposing (RegisterMsg(..))


type RegisterMsg
    = Register
    | CheckIfValid
    | UpdateUserNameField String
    | UpdateFirstEmailField String
    | UpdateSecondEmailField String
    | UpdateFirstPasswordField String
    | UpdateSecondPasswordField String
