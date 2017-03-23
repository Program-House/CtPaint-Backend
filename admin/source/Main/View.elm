module Main.View exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import Main.Types exposing (Page(..))
import View.Basics exposing (words)
import View.AppBar as AppBar
import SignIn.View as SignIn
import User.View as User


view : Model -> Html Msg
view model =
    if model.loggedIn then
        div
            [ class "main logged-in" ]
            [ AppBar.view model
            , page model
            ]
    else
        div
            [ class "main" ]
            [ SignIn.view model ]


page : Model -> Html Msg
page model =
    case model.page of
        UsersPage state ->
            User.view model state

        _ ->
            Html.text ""
