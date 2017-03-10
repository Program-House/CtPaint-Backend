module Main.Model exposing (..)

import Navigation exposing (Location)
import Register.Model exposing (RegisterModel)
import Home.Model exposing (HomeModel)


type alias Model =
    { location : Location
    , pageState : PageState
    , user : Maybe User
    }


type alias User =
    { name : String
    , email : String
    }


type PageState
    = RegisterState RegisterModel
    | HomeState HomeModel
    | ErrorState String
    | None
