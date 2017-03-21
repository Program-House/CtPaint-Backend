module SignIn.Message exposing (SignInMsg(..))

import Http
import Json.Decode as Decode


type SignInMsg
    = SignIn
    | SignInResult (Result Http.Error Decode.Value)
    | UpdateUsernameField String
    | UpdatePasswordField String
