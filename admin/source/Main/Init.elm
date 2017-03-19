module Main.Init exposing (model)

import Main.Model exposing (Model, Page(..))


model : Model
model =
    { page = None
    , publicKey = Nothing
    }
