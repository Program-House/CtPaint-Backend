module Main exposing (..)

import Html
import Main.Types exposing (..)
import Ports exposing (..)
import Main.View exposing (view)
import Main.Subscriptions exposing (subscriptions)
import Main.Update exposing (update)


-- MAIN


main =
    Html.program
        { init = ( Model "", Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

