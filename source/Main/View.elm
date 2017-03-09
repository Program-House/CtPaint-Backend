module Main.View exposing (view)

import Html exposing (..)
import Main.Model exposing (..)
import Main.Message exposing (..)
import Main.Util as Util
import Pages.Home as Home
import Pages.Error as Error


-- VIEW


view : Model -> Html Msg
view { location } =
    case location.pathname of
        "/" ->
            Home.view

        "/error" ->
            Error.view

        _ ->
            p [] [ text " not dank " ]
