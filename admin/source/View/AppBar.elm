module View.AppBar exposing (view)

import Html exposing (Html, node, hr)
import Html.Attributes exposing (style, class)
import Html.Events exposing (onClick)
import Main.Message exposing (Message(..))
import Main.Model exposing (Model)
import Main.Types exposing (Page(..))
import View.Basics exposing (words)


view : Model -> Html Message
view model =
    let
        button_ =
            button model.page
    in
        appbar
            [ button_ "Users"
            , button_ "Verifications"
            , button_ "Projects"
            , button_ "Administrators"
            ]


appbar : List (Html Message) -> Html Message
appbar children =
    node "app-bar" [] children


button : Page -> String -> Html Message
button currentPage thisPage =
    let
        selected =
            if areSame currentPage thisPage then
                " selected"
            else
                ""
    in
        node
            "app-bar-button"
            [ onClick (SetPage thisPage)
            , class selected
            ]
            [ words
                [ class selected ]
                thisPage
            , hr
                [ class ("button-bottom-border" ++ selected) ]
                []
            ]


areSame : Page -> String -> Bool
areSame page str =
    case ( str, page ) of
        ( "Users", UsersPage _ ) ->
            True

        ( "Verifications", VerificationsPage _ ) ->
            True

        ( "Projects", ProjectsPage _ ) ->
            True

        ( "Administrators", AdministratorsPage _ ) ->
            True

        _ ->
            False
