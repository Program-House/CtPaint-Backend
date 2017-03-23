module User.Model exposing (Model, User)


type alias User =
    { username : String
    , email : String
    , verified : Bool
    }


type alias Model =
    { users : List User
    , current : Maybe String
    , usernameField : String
    }
