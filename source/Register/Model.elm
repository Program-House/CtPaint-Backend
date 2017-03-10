module Register.Model
    exposing
        ( RegisterModel
        , Problem(..)
        , Field(..)
        )


type alias RegisterModel =
    { firstEmail : String
    , secondEmail : String
    , firstPassword : String
    , secondPassword : String
    , username : ( String, Bool )
    , problems : List Problem
    , showIncomplete : Bool
    }


type Problem
    = FormIncomplete (List Field)
    | UserNameTaken
    | EmailsDontMatch
    | PasswordsDontMatch


type Field
    = UserName
    | FirstEmail
    | SecondEmail
    | FirstPassword
    | SecondPassword
