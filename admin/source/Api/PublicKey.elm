module Api.PublicKey exposing (get)

import Http
import Main.Message exposing (Message(..))
import Api.Util exposing (root)


get : Cmd Message
get =
    root "/api/key"
        |> Http.getString
        |> Http.send (GetServersPublicKey)
