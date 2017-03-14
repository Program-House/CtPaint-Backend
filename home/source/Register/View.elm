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
view model =
    if model.successfulRegistrationOccured then
        card
            [ class "solitary register-success" ]
            [ words <| "You are registered! One last thing, you need to verify your email address. " ++ model.firstEmail ++ " should get an email containing your verifcation link. Click that link and you are good to go." ]
    else
        let
            problemsToShow =
                if model.showProblems then
                    model.problems
                else
                    []
        in
            (card [ class "solitary register" ] << List.concat)
                [ [ words "Register new CtPaint account" ]
                , Fields.username
                    model.username
                    problemsToShow
                    model.showFields
                , Fields.emails
                    model.firstEmail
                    model.secondEmail
                    problemsToShow
                    model.showFields
                , Fields.passwords
                    model.firstPassword
                    model.secondPassword
                    problemsToShow
                    model.showFields
                , [ Components.register ]
                ]
