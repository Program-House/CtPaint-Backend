module Register.Problems exposing (set)

import Register.Model exposing (RegisterModel, Problem(..), Field(..))
import Register.Alphanumeric as Alphanumeric


set : RegisterModel -> RegisterModel
set model =
    { model
        | problems =
            allPossibleProblems model
                |> List.filter (not << Tuple.first)
                |> List.map (Tuple.second)
    }


allPossibleProblems : RegisterModel -> List ( Bool, Problem )
allPossibleProblems { firstEmail, secondEmail, firstPassword, secondPassword, username } =
    [ ( username /= "", UserNameEmpty )
    , ( firstPassword == secondPassword, PasswordsDontMatch )
    , ( firstEmail == secondEmail, EmailsDontMatch )
    , ( allAreTrue
            [ String.length firstPassword > 8
            , String.all Alphanumeric.is firstPassword
            , String.any Alphanumeric.isNumeric firstPassword
            ]
      , PasswordInvalid
      )
    , ( allAreTrue
            [ String.contains "@" firstEmail
            , String.contains "." firstEmail
            , not <| String.endsWith "." firstEmail
            ]
      , EmailInvalid
      )
    ]


allAreTrue : List Bool -> Bool
allAreTrue =
    List.foldr (&&) True
