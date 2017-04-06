module Verification.Model
    exposing
        ( Verification
        , Model
        , Init
        )


type alias Verification =
    { email : String
    , username : String
    }


type SearchParameter
    = ByEmail
    | ByUsername


type alias Model =
    { verifications : List Verification
    , current : Maybe String
    , usernameField : String
    , searchField : String
    , searchParameter : SearchParameter
    , searchParameterDropped : Bool
    }


init : Model
init =
    { verifications = []
    , current = Nothing
    , usernameField = ""
    , searchField = ""
    , searchParameter = ByEmail
    , searchParameterDropped = False
    }
