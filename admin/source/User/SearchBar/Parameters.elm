module User.SearchBar.Parameters exposing (view)

import Html exposing (Html, node)
import Html.Attributes exposing (class)
import Main.Message exposing (Msg(..))
import View.Basics exposing (words)
import User.Message exposing (UserMsg(..))
import User.Model exposing (Model)
import User.SearchBar.Components
    exposing
        ( parametersContainer
        , dropDownButton
        , triangle
        )


view : Model -> Html Msg
view model =
    parametersContainer
        [ words [ class "drop-down" ] "by email"
        , dropDownButton [ triangle ]
        ]
