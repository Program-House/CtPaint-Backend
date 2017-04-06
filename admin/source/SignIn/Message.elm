module SignIn.Message exposing (SignInMessage(..))

import Http
import Json.Decode as Decode


type SignInMessage
    = SignIn
    | UpdateUsernameField String
    | UpdatePasswordField String
    | HandleEnter Bool
