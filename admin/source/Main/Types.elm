module Main.Types
    exposing
        ( Page(..)
        , UsersState
        , AdministratorsState
        , ProjectsState
        , VerificationsState
        )


type Page
    = UsersPage UsersState
    | VerificationsPage VerificationsState
    | ProjectsPage ProjectsState
    | AdministratorsPage AdministratorsState


type alias UsersState =
    { users : List User
    , current : Maybe String
    }


type alias AdministratorsState =
    { administrators : List Admin
    , current : Maybe String
    }


type alias ProjectsState =
    { projects : List Project
    , current : Maybe String
    }


type alias VerificationsState =
    { verifications : List Verification
    , current : Maybe String
    }


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
