module Main.Auth exposing (..)

import Main.Message exposing (Msg(..))
import Http
import Main.Api as Api
import Json.Decode as Json


getPublicKey : (String -> Cmd Msg) -> Cmd Msg
getPublicKey msg =
    Api.root "/api/key"
        |> Http.getString
        |> Http.send (GetPublicKey msg)
