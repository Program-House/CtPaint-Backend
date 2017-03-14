module Register.Errors exposing (get, msg)

import Html exposing (Html)
import Main.Message exposing (Msg(..))
import Register.Model exposing (Field(..), Problem(..))
import Register.Components


get : List Problem -> List Problem -> Maybe String
get existingProblems fieldsProblems =
    let
        relevantProblems =
            List.filter
                (exists existingProblems)
                fieldsProblems
    in
        case relevantProblems of
            [] ->
                Nothing

            head :: rest ->
                Just (getErrorMessage head)


exists : List Problem -> Problem -> Bool
exists problems problem =
    List.member problem problems


msg : Maybe String -> List (Html Msg)
msg msg =
    case msg of
        Nothing ->
            []

        Just str ->
            [ Register.Components.warning str ]


getErrorMessage : Problem -> String
getErrorMessage problem =
    case problem of
        UserNameInvalid ->
            "alphanumeric characters only"

        UserNameEmpty ->
            "you need a username"

        EmailsDontMatch ->
            "emails dont match"

        PasswordsDontMatch ->
            "passwords dont match"

        PasswordInvalid ->
            "Password can contain numbers and letters only, at least one number"

        EmailInvalid ->
            "email is invalid"

        FirstEmailEmpty ->
            "enter your email"

        SecondEmailEmpty ->
            "enter your email twice"

        FirstPasswordEmpty ->
            "enter a password"

        SecondPasswordEmpty ->
            "enter the same password twice"

        ConnectionFailure ->
            "trouble connecting to the server"

        EmailAlreadyRegistered ->
            "email is already registered"
