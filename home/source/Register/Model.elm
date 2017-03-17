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
    , username : String
    , problems : List Problem
    , showProblems : Bool
    , showFields : Bool
    , registrationPending : Bool
    }


type Problem
    = UserNameInvalid
    | UserNameEmpty
    | EmailsDontMatch
    | FirstEmailEmpty
    | SecondEmailEmpty
    | EmailInvalid
    | PasswordsDontMatch
    | FirstPasswordEmpty
    | SecondPasswordEmpty
    | PasswordInvalid
    | ConnectionFailure
    | EmailAlreadyRegistered


type Field
    = UserName
    | FirstEmail
    | SecondEmail
    | FirstPassword
    | SecondPassword
