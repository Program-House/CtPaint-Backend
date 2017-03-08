module Main.Init exposing (model)

import Main.Model exposing (..)
import Main.Message exposing (Msg(..))
import Main.Util as Util
import Navigation exposing (Location)


model : Location -> ( Model, Cmd Msg )
model location =
    if Util.isPossible location then
        ( { location = location }, Cmd.none )
    else
        ( { location = location }, Navigation.newUrl "" )
