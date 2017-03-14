module Register.View exposing (view)

import Html exposing (Html, br, div)
import Html.Attributes exposing (class, style)
import Register.Model exposing (RegisterModel, Problem(..))
import Register.Message exposing (RegisterMsg(..))
import Main.Message exposing (Msg(..))
import Main.Components exposing (card, words, errorBox, warning)
import Register.Components as Components
import Register.Fields as Fields


view : RegisterModel -> Html Msg
view { showFields, showProblems, username, firstEmail, secondEmail, problems, firstPassword, secondPassword } =
    let
        problemsToShow =
            if showProblems then
                problems
            else
                []
    in
        List.concat
            [ [ words "Register new CtPaint account" ]
            , Fields.username
                username
                problemsToShow
                showFields
            , Fields.emails
                firstEmail
                secondEmail
                problemsToShow
                showFields
            , Fields.passwords
                firstPassword
                secondPassword
                problemsToShow
                showFields
            , [ Components.register ]
            ]
            |> card [ class "solitary register" ]
