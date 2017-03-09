module Main.Model exposing (..)

import Navigation exposing (Location)
import Register.Model exposing (RegisterModel)
import Home.Model exposing (HomeModel)


type alias Model =
    { location : Location
    , pageState : PageState
    }


type PageState
    = RegisterState RegisterModel
    | HomeState HomeModel
    | ErrorState String
