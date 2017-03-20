module Main.Model exposing (Model, Page(..))


type alias Model =
    { page : Page
    , publicKey : Maybe String
    , usernameField : String
    , passwordField : String
    , loggedIn : Bool
    }


type Page
    = User
    | Verification
    | Project
    | Administrator
