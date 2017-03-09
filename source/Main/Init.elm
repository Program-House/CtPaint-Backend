module Main.Init exposing (model)

import Main.Model exposing (..)
import Main.Message exposing (Msg(..))
import Main.Util as Util
import Navigation exposing (Location)


model : Location -> ( Model, Cmd Msg )
model location =
    ( freshModel location
    , cmd location
    )


freshModel : Location -> Model
freshModel location =
    { location = location
    , pageState = HomeState ()
    }


cmd : Location -> Cmd Msg
cmd location =
    if Util.isPossible location then
        Cmd.none
    else
        Navigation.newUrl ""
