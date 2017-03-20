module Main.Message exposing (Msg(..))

import Main.Model exposing (Page(..))
import Http


type Msg
    = SetPage Page
    | GetPublicKey (Result Http.Error String)
    | UpdateUsernameField String
    | UpdatePasswordField String
    | SignIn
