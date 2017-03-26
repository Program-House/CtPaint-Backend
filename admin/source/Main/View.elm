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
    case model.page of
        SignInPage state ->
            div
                [ class "main" ]
                [ SignIn.view state ]

        UsersPage state ->
            loggedIn model (User.view model state)

        _ ->
            loggedIn model (Html.text "")


loggedIn : Model -> Html Msg -> Html Msg
loggedIn model child =
    div
        [ class "main logged-in" ]
        [ AppBar.view model
        , child
        ]
