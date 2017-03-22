module SignIn.Message exposing (SignInMsg(..))

import Http
import Json.Decode as Decode


type SignInMsg
    = SignIn
    | SignInResult (Result Http.Error Decode.Value)
    | SignInPlaintext String
    | UpdateUsernameField String
    | UpdatePasswordField String
    | HandleEnter Bool
