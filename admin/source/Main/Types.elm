module Main.Types
    exposing
        ( Page(..)
        , AdministratorsState
        , ProjectsState
        , VerificationsState
        )

import User.Model as User
import SignIn.Model as SignIn


type Page
    = UsersPage User.Model
    | VerificationsPage VerificationsState
    | ProjectsPage ProjectsState
    | AdministratorsPage AdministratorsState
    | SignInPage SignIn.Model


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
