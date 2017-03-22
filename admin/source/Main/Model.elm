module Main.Model exposing (Model)

import Main.Message exposing (Msg(..))
import Main.Types exposing (Page(..))


type alias Model =
    { page : Page
    , serversPublicKey : Maybe String
    , sessionToken : Maybe String
    , clientsPublicKey : Maybe String
    , usernameField : String
    , passwordField : String
    , loggedIn : Bool
    , withEncryption : String -> Cmd Msg
    , withPlaintext : Maybe (String -> Msg)
    }
