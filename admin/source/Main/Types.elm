module Main.Types exposing (Page(..))


type Page
    = Users
    | Verifications
    | Projects
    | Administrators


type alias User =
    { username : String
    , email : String
    , verified : Bool
    }


type alias Admin =
    { username : String }


type alias Verification =
    { email : String
    , code : String
    }


type alias Project =
    { owner : String
    , members : List String
    }
