module SignIn.Message exposing (SignInMsg(..))

import Http
import Json.Decode as Decode


type SignInMsg
    = SignIn
    | UpdateUsernameField String
    | UpdatePasswordField String
    | HandleEnter Bool
