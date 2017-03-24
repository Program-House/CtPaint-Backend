module User.Message exposing (UserMsg(..))


type UserMsg
    = UpdateUsernameField String
    | UpdateSearchField String
    | HandleEnter Bool
