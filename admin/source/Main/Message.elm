module Main.Message exposing (Msg(..))

import Main.Types exposing (Page(..))
import Http
import Json.Decode as Decode


type Msg
    = SetPage Page
    | GetPublicKey (Result Http.Error String)
    | GetSessionToken String
    | UpdateUsernameField String
    | UpdatePasswordField String
    | SignIn
    | SignInResult (Result Http.Error Decode.Value)
    | GetEncryption String
