module User.Model exposing (Model, User, init)


type alias User =
    { username : String
    , email : String
    , verified : Bool
    , frozen : Bool
    }


type alias Model =
    { users : List User
    , current : Maybe String
    , usernameField : String
    , searchField : String
    }


init : Model
init =
    { users = []
    , current = Nothing
    , usernameField = ""
    , searchField = ""
    }
