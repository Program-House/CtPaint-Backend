module Main.Subscriptions exposing (subscriptions)


import Main.Types exposing (..)
import Ports exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    fromJS HandlePort

    