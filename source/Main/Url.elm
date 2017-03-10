module Main.Url exposing (handle)

import Navigation exposing (Location)
import Main.Model exposing (Model, PageState(..))
import Register.Init
import Main.Message exposing (Msg(..))


handle : Location -> Model -> ( Model, Cmd Msg )
handle location model =
    model
        |> setLocation location
        |> handlePath


handlePath : Model -> ( Model, Cmd Msg )
handlePath model =
    case Debug.log "path" <| model.location.pathname of
        "/" ->
            ( setState (HomeState ()) model
            , Cmd.none
            )

        "/register" ->
            ( setState (Register.Init.model) model
            , Cmd.none
            )

        _ ->
            ( setState
                (ErrorState "Page does not exist")
                model
            , Cmd.none
            )


setLocation : Location -> Model -> Model
setLocation location model =
    { model | location = location }


setState : PageState -> Model -> Model
setState state model =
    { model | pageState = state }
