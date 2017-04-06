module SignIn.Message exposing (SignInMessage(..))


type SignInMessage
    = SignIn
    | UpdateUsernameField String
    | UpdatePasswordField String
    | HandleEnter
