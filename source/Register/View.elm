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
view { showProblems, username, firstEmail, secondEmail, problems, firstPassword, secondPassword } =
    let
        problemsToShow =
            if showProblems then
                problems
            else
                []
    in
        List.concat
            [ [ words "Register new CtPaint account" ]
            , Fields.username username problemsToShow
            , Fields.emails firstEmail secondEmail problemsToShow
            , Fields.passwords firstPassword secondPassword problemsToShow
            , [ Components.register ]
            ]
            |> card [ class "solitary register" ]



----card
----    [ class "solitary register" ]
--    [ words "Register new CtPaint account"
--    , Fields.username username problems
--    , Components.field
--        "email"
--        "your email"
--        firstEmail
--        (check showProblems problems (always True))
--        (RegisterWrapper << UpdateFirstEmailField)
--    , Components.field
--        "email"
--        "your email again"
--        secondEmail
--        True
--        (RegisterWrapper << UpdateSecondEmailField)
--    , errorBox [ warning "registration" "" ]
--    , Components.password
--        "password"
--        "password"
--        firstPassword
--        True
--        (RegisterWrapper << UpdateFirstPasswordField)
--    , Components.password
--        "password"
--        "password"
--        secondPassword
--        True
--        (RegisterWrapper << UpdateSecondPasswordField)
--    , br [] []
--    , Components.button problems
--    ]
--check : Bool -> List Problem -> List Problem -> Bool
--check show problems forThisField =
--    if show then
--        forThisField problems
--    else
--        False
