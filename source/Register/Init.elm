module Register.Init exposing (model)

import Main.Model exposing (Model, PageState(..))
import Navigation exposing (Location)
import Register.Model
    exposing
        ( RegisterModel
        , Problem(..)
        , Field(..)
        )


model : PageState
model =
    RegisterState
        { firstEmail = ""
        , secondEmail = ""
        , firstPassword = ""
        , secondPassword = ""
        , username = ( "", False )
        , problems = problems
        , showIncomplete = False
        }


problems : List Problem
problems =
    [ FormIncomplete
        [ UserName
        , FirstEmail
        , SecondEmail
        , FirstPassword
        , SecondPassword
        ]
    ]
