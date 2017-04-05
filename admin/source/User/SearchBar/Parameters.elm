module User.SearchBar.Parameters exposing (view)

import Html exposing (Html, node)
import Html.Attributes exposing (class)
import Main.Message exposing (Msg(..))
import View.Basics exposing (words)
import User.Message exposing (UserMsg(..))
import User.Model exposing (Model, SearchParameter(..))
import User.SearchBar.Components exposing (..)


view : Model -> Html Msg
view model =
    model
        |> body
        |> parametersContainer


body : Model -> List (Html Msg)
body { searchParameterDropped, searchParameter } =
    if searchParameterDropped == True then
        List.append (unexpandedContent searchParameter)
            [ options [ ByEmail, ByUsername ] ]
    else
        (unexpandedContent searchParameter)


unexpandedContent : SearchParameter -> List (Html Msg)
unexpandedContent parameter =
    [ dropDownWords parameter
    , dropDownButton [ triangle ]
    ]
