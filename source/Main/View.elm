module Main.View exposing (view)

import Html exposing (..)
import Main.Model exposing (..)
import Main.Message exposing (..)
import Main.Util as Util


-- VIEW


view : Model -> Html Msg
view { location } =
    case location.pathname of
        "/" ->
            h1 [] [ text "dank" ]

        _ ->
            h1 [] [ text " not dank " ]
