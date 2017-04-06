module User.Message exposing (UserMessage(..))

import User.Model exposing (SearchParameter(..))


type UserMessage
    = UpdateUsernameField String
    | UpdateSearchField String
    | HandleEnter
    | DropSearchParameters
    | SetDropDown SearchParameter
