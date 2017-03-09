module Register.Model exposing (RegisterModel)


type alias RegisterModel =
    { firstEmail : String
    , secondEmail : String
    , firstPassword : String
    , secondPassword : String
    , username : String
    , problems : List Problem
    }


type Problem
    = FormIncomplete
    | UsernameTaken
    | EmailsDontMatch
    | PasswordsDontMatch
