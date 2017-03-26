module SignIn.Model exposing (Model, init)


type alias Model =
    { usernameField : String
    , passwordField : String
    }


init : Model
init =
    Model "" ""
