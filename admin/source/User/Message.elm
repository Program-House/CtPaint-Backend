module User.Message exposing (UserMessage(..))

import User.Model exposing (SearchParameter(..))


type UserMessage
    = UpdateUsernameField String
    | UpdateSearchField String
    | HandleEnter Bool
    | DropSearchParameters
    | SetDropDown SearchParameter
