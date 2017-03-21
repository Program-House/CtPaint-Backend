module Api.PublicKey exposing (get)

import Http
import Main.Message exposing (Msg(..))
import Api.Util exposing (root)


get : Cmd Msg
get =
    root "/api/key"
        |> Http.getString
        |> Http.send (GetServersPublicKey)
