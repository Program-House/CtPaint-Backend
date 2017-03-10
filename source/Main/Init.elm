module Main.Init exposing (tuple)

import Main.Model exposing (..)
import Main.Message exposing (Msg(..))
import Navigation exposing (Location)
import Main.Url as Url


tuple : Location -> ( Model, Cmd Msg )
tuple location =
    Url.handle location (model location)


model : Location -> Model
model location =
    { location = location
    , pageState = None
    }
