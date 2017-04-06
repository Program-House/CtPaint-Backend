module User.SearchBar.Parameters exposing (view)

import Html exposing (Html, node)
import Html.Attributes exposing (class)
import Main.Message exposing (Message(..))
import View.Basics exposing (words)
import User.Message exposing (UserMessage(..))
import User.Model exposing (Model, SearchParameter(..))
import User.SearchBar.Components exposing (..)


view : Model -> Html Message
view model =
    model
        |> body
        |> parametersContainer


body : Model -> List (Html Message)
body { searchParameterDropped, searchParameter } =
    if searchParameterDropped == True then
        List.append (unexpandedContent searchParameter)
            [ options [ ByEmail, ByUsername ] ]
    else
        (unexpandedContent searchParameter)


unexpandedContent : SearchParameter -> List (Html Message)
unexpandedContent parameter =
    [ dropDownWords parameter
    , dropDownButton [ triangle ]
    ]
