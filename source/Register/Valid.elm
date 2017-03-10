module Register.Valid exposing (check)

import Register.Model exposing (RegisterModel, Problem(..))
import Register.Alphanumeric as Alphanumeric


check : RegisterModel -> List Problem
check model =
    []
        |> passwordsAreSame model
        |> passwordIsValid model
        |> emailsAreSame model
        |> emailIsValid model


passwordsAreSame : RegisterModel -> List Problem -> List Problem
passwordsAreSame model problems =
    if model.firstPassword == model.secondPassword then
        problems
    else
        PasswordsDontMatch :: problems


emailsAreSame : RegisterModel -> List Problem -> List Problem
emailsAreSame model problems =
    if model.firstEmail == model.secondEmail then
        problems
    else
        EmailsDontMatch :: problems


emailIsValid : RegisterModel -> List Problem -> List Problem
emailIsValid { firstEmail, secondEmail } problems =
    let
        valid =
            allAreTrue
                [ String.contains "@" firstEmail
                , String.contains "." firstEmail
                , not <| String.endsWith "." firstEmail
                ]
    in
        if valid then
            problems
        else
            EmailInvalid :: problems


passwordIsValid : RegisterModel -> List Problem -> List Problem
passwordIsValid model problems =
    let
        valid =
            allAreTrue
                [ String.length model.firstPassword > 8
                , String.all Alphanumeric.is model.firstPassword
                , String.any Alphanumeric.isNumeric model.firstPassword
                ]
    in
        if valid then
            problems
        else
            PasswordInvalid :: problems


allAreTrue : List Bool -> Bool
allAreTrue =
    List.foldr (&&) True
