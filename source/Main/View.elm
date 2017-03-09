module Main.View exposing (view)

import Html exposing (..)
import Main.Model exposing (..)
import Main.Message exposing (..)
import Main.Util as Util
import Home.View as Home
import Error.View as Error
import Register.View as Register


-- VIEW


view : Model -> Html Msg
view { location } =
    case location.pathname of
        "/" ->
            Home.view

        "/error" ->
            Error.view

        "/register" ->
            Register.view

        _ ->
            p [] [ text " not dank " ]
