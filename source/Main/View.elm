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
view { location, pageState } =
    case location.pathname of
        "/" ->
            Home.view

        "/error" ->
            case pageState of
                ErrorState errorMsg ->
                    Error.view errorMsg

                _ ->
                    Error.view "Trying to view error page, without error page state"

        "/register" ->
            case pageState of
                RegisterState model ->
                    Register.view model

                _ ->
                    Error.view "Trying to view a page state that isnt register state"

        _ ->
            p [] [ text " not dank " ]
