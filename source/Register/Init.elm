module Register.Init exposing (model)

import Main.Model exposing (Model, PageState(..))
import Register.Model exposing (RegisterModel)
import Navigation exposing (Location)


model : PageState
model =
    RegisterState
        { firstEmail = ""
        , secondEmail = ""
        , firstPassword = ""
        , secondPassword = ""
        , username = ""
        , problems = []
        }
