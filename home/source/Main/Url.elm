module Main.Url exposing (handle)

import Navigation exposing (Location)
import Main.Model exposing (Model, PageState(..))
import Register.Init
import Main.Message exposing (Msg(..))
import Debug exposing (log)


handle : Location -> Model -> ( Model, Cmd Msg )
handle location model =
    model
        |> setLocation location
        |> handlePath


handlePath : Model -> ( Model, Cmd Msg )
handlePath model =
    case String.split "/" model.location.pathname of
        [] ->
            dne model

        _ :: paths ->
            mainPaths paths model


mainPaths : List String -> Model -> ( Model, Cmd Msg )
mainPaths paths model =
    case paths of
        "" :: _ ->
            ( setState (HomeState ()) model
            , Cmd.none
            )

        "register" :: _ ->
            ( setState (Register.Init.model) model
            , Cmd.none
            )

        head :: rest_ ->
            dne model

        _ ->
            dne model


dne : Model -> ( Model, Cmd Msg )
dne model =
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
