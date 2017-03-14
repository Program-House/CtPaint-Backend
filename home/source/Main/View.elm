module Main.View exposing (view)

import Html exposing (..)
import Main.Model exposing (..)
import Main.Message exposing (..)
import Home.View as Home
import Error.View as Error
import Register.View as Register
import SuccessfulRegister.View as SuccessfulRegister


view : Model -> Html Msg
view { location, pageState } =
    case pageState of
        RegisterState model ->
            Register.view model

        SuccessfulRegisterState email ->
            SuccessfulRegister.view email

        ErrorState message ->
            Error.view message

        HomeState model ->
            Home.view

        None ->
            Error.view "No page state"
