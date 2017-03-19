module Subscriptions exposing (subscriptions)

import Types exposing (..)
import Ports exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    fromJS HandlePort
