module Main.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import View.Components exposing (words)
import View.AppBar as AppBar


-- VIEW


view : Model -> Html Msg
view model =
    div
        [ class "main" ]
        [ AppBar.view model ]
