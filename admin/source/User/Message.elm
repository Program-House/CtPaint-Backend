module User.Message exposing (UserMsg(..))

import User.Model exposing (SearchParameter(..))


type UserMsg
    = UpdateUsernameField String
    | UpdateSearchField String
    | HandleEnter Bool
    | DropSearchParameters
    | SetDropDown SearchParameter
