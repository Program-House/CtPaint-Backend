module Register.Fields exposing (..)

import Html exposing (Html)
import Main.Message exposing (Msg(..))
import Register.Model exposing (Problem(..), Field(..))
import Register.Message exposing (RegisterMsg(..))
import Register.Components as Components
import Main.Components exposing (errorBox)
import Register.Errors as Error


username : String -> List Problem -> List (Html Msg)
username str problems =
    let
        error =
            Error.get
                problems
                [ UserNameEmpty
                , UserNameInvalid
                , UserNameTaken
                ]
    in
        [ Components.field
            "username"
            "username"
            str
            (error /= Nothing)
            (RegisterWrapper << UpdateUserNameField)
        , errorBox (Error.msg error)
        ]


emails : String -> String -> List Problem -> List (Html Msg)
emails firstEmail secondEmail problems =
    let
        error =
            Error.get
                problems
                [ FirstEmailEmpty
                , EmailInvalid
                , SecondEmailEmpty
                , EmailsDontMatch
                ]
    in
        [ Components.field
            "email"
            "your email"
            firstEmail
            (error /= Nothing)
            (RegisterWrapper << UpdateFirstEmailField)
        , Components.field
            "email"
            "your email"
            secondEmail
            (error /= Nothing)
            (RegisterWrapper << UpdateSecondEmailField)
        , errorBox (Error.msg error)
        ]


passwords : String -> String -> List Problem -> List (Html Msg)
passwords firstPassword secondPassword problems =
    let
        error =
            Error.get
                problems
                [ FirstPasswordEmpty
                , PasswordInvalid
                , SecondPasswordEmpty
                , PasswordsDontMatch
                ]
    in
        [ Components.password
            "password"
            "enter a password"
            firstPassword
            (error /= Nothing)
            (RegisterWrapper << UpdateFirstPasswordField)
        , Components.password
            "password"
            "enter it again"
            secondPassword
            (error /= Nothing)
            (RegisterWrapper << UpdateSecondPasswordField)
        , errorBox (Error.msg error)
        ]
