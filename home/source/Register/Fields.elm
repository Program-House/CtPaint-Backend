module Register.Fields exposing (..)

import Html exposing (Html)
import Main.Message exposing (Msg(..))
import Register.Model exposing (Problem(..), Field(..))
import Register.Message exposing (RegisterMsg(..))
import Register.Components as Components
import Main.Components exposing (errorBox)
import Register.Errors as Error


username : String -> List Problem -> Bool -> List (Html Msg)
username str problems showField =
    let
        error =
            Error.get
                problems
                [ UserNameEmpty
                , UserNameInvalid
                ]

        content =
            if showField then
                str
            else
                "********"
    in
        [ Components.field
            "username"
            "username"
            content
            (error /= Nothing)
            (RegisterWrapper << UpdateUserNameField)
        , errorBox (Error.msg error)
        ]


emails : String -> String -> List Problem -> Bool -> List (Html Msg)
emails firstEmail secondEmail problems showField =
    let
        error =
            Error.get
                problems
                [ FirstEmailEmpty
                , EmailInvalid
                , SecondEmailEmpty
                , EmailsDontMatch
                , EmailAlreadyRegistered
                ]

        ( firstEmailContent, secondEmailContent ) =
            if showField then
                ( firstEmail, secondEmail )
            else
                ( "********", "********" )
    in
        [ Components.field
            "email"
            "your email"
            firstEmailContent
            (error /= Nothing)
            (RegisterWrapper << UpdateFirstEmailField)
        , Components.field
            "email"
            "your email again"
            secondEmailContent
            (error /= Nothing)
            (RegisterWrapper << UpdateSecondEmailField)
        , errorBox (Error.msg error)
        ]


passwords : String -> String -> List Problem -> Bool -> List (Html Msg)
passwords firstPassword secondPassword problems showField =
    let
        error =
            Error.get
                problems
                [ FirstPasswordEmpty
                , PasswordInvalid
                , SecondPasswordEmpty
                , PasswordsDontMatch
                ]

        ( firstPasswordContent, secondPasswordContent ) =
            if showField then
                ( firstPassword, secondPassword )
            else
                ( "********", "********" )
    in
        [ Components.password
            "password"
            "enter a password"
            firstPasswordContent
            (error /= Nothing)
            (RegisterWrapper << UpdateFirstPasswordField)
        , Components.password
            "password"
            "enter it again"
            secondPasswordContent
            (error /= Nothing)
            (RegisterWrapper << UpdateSecondPasswordField)
        , errorBox (Error.msg error)
        ]
