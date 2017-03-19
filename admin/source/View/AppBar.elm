module View.AppBar exposing (view)

import Html exposing (Html, node, hr)
import Html.Attributes exposing (style, class)
import Html.Events exposing (onClick)
import Main.Message exposing (Msg(..))
import Main.Model exposing (Model, Page(..))
import View.Components exposing (words)


view : Model -> Html Msg
view model =
    let
        button_ =
            button model.page
    in
        appbar
            [ button_ User
            , button_ Verification
            , button_ Project
            , button_ Administrator
            ]


appbar : List (Html Msg) -> Html Msg
appbar children =
    node "appbar" [] children


button : Page -> Page -> Html Msg
button currentPage thisPage =
    let
        selected =
            if currentPage == thisPage then
                " selected"
            else
                ""
    in
        node
            "appbarbutton"
            [ onClick (SetPage thisPage)
            , class selected
            ]
            [ words
                [ class selected ]
                (toString thisPage)
            , hr
                [ class ("button-bottom-border" ++ selected) ]
                []
            ]
