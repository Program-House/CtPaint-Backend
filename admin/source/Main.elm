module Main exposing (..)

import Html
import Main.Model exposing (Model)
import Ports exposing (..)
import Main.View exposing (view)
import Main.Update exposing (update)
import Main.Subscriptions exposing (subscriptions)
import Main.Init as Init


-- MAIN


main =
    Html.program
        { init = ( Init.model, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
