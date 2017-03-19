module Main.Init exposing (tuple)

import Main.Model exposing (..)
import Main.Message exposing (Msg(..))
import Navigation exposing (Location)
import Main.Router as Router


tuple : Location -> ( Model, Cmd Msg )
tuple location =
    Router.handle location (model location)


model : Location -> Model
model location =
    { location = location
    , pageState = None
    , user = Nothing
    , publicKey = Nothing
    }
