module Main.Model exposing (Model, Page(..))


type alias Model =
    { page : Page
    , publicKey : Maybe String
    }


type Page
    = User
    | Verification
    | Project
    | Administrator
    | None
