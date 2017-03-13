module Main exposing (..)

import Html
import Types exposing (..)
import Ports exposing (..)
import View exposing (view)
import Subscriptions exposing (subscriptions)


-- MAIN


main =
    Html.program
        { init = ( Model "", Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- UPDATE


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
