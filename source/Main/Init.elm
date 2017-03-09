module Main.Init exposing (tuple)

import Main.Model exposing (..)
import Main.Message exposing (Msg(..))
import Main.Util as Util
import Navigation exposing (Location)


tuple : Location -> ( Model, Cmd Msg )
tuple location =
    ( model location
    , cmd location
    )


model : Location -> Model
model location =
    { location = location
    , pageState = HomeState ()
    }


cmd : Location -> Cmd Msg
cmd location =
    if Util.isPossible location then
        Cmd.none
    else
        Navigation.newUrl ""
