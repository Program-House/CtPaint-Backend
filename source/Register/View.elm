module Register.View exposing (view)

import Html exposing (Html, br)
import Html.Attributes exposing (class, style)
import Register.Model exposing (RegisterModel)
import Register.Message exposing (RegisterMsg(..))
import Register.Button as Button
import Main.Message exposing (Msg(..))
import Main.Components exposing (card, words)
import Register.Components as Components
import Register.UserName as UserName


view : RegisterModel -> Html Msg
view { username, firstEmail, secondEmail, problems, firstPassword, secondPassword } =
    card
        [ class "solitary register" ]
        [ words "Register new CtPaint account"
        , UserName.field
            "username"
            "username"
            username
        , br [] []
        , Components.field
            "email"
            "your email"
            firstEmail
            (RegisterWrapper << UpdateFirstEmailField)
        , Components.field
            "email"
            "your email again"
            secondEmail
            (RegisterWrapper << UpdateSecondEmailField)
        , br [] []
        , Components.password
            "password"
            "password"
            firstPassword
            (RegisterWrapper << UpdateFirstPasswordField)
        , Components.password
            "password"
            "password"
            secondPassword
            (RegisterWrapper << UpdateSecondPasswordField)
        , br [] []
        , Button.view problems
        ]
