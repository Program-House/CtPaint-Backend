module Main.Update exposing (update)

import Main.Types exposing (Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        UpdateField str ->
            Model str ! []

        CheckIfEnter code ->
            if code == 13 then
                Model "Submitted!" ! []
            else
                model ! []

        HandlePort str ->
            Model str ! []
