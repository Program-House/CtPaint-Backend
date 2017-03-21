module Main.Model exposing (Model)

import Main.Message exposing (Msg(..))
import Main.Types exposing (Page(..))


type alias Model =
    { page : Page
    , publicKey : Maybe String
    , sessionToken : Maybe String
    , usernameField : String
    , passwordField : String
    , loggedIn : Bool
    , withEncryption : String -> Cmd Msg
    }
