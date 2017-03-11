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
        , username = ""
        , problems = problems
        , showProblems = False
        }


problems : List Problem
problems =
    [ UserNameEmpty
    , FirstEmailEmpty
    , SecondEmailEmpty
    , FirstPasswordEmpty
    , SecondPasswordEmpty
    ]
