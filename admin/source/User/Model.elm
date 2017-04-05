module User.Model
    exposing
        ( Model
        , User
        , SearchParameter(..)
        , init
        )


type alias User =
    { username : String
    , email : String
    , verified : Bool
    , frozen : Bool
    }


type SearchParameter
    = ByEmail
    | ByUsername


type alias Model =
    { users : List User
    , current : Maybe String
    , usernameField : String
    , searchField : String
    , searchParameter : SearchParameter
    , searchParameterDropped : Bool
    }


init : Model
init =
    { users = []
    , current = Nothing
    , usernameField = ""
    , searchField = ""
    , searchParameter = ByEmail
    , searchParameterDropped = False
    }
