port module Ports exposing (..)


port requestSessionToken : () -> Cmd msg


port getSessionToken : (String -> msg) -> Sub msg


port encrypt : ( String, String ) -> Cmd msg


port getEncryption : (String -> msg) -> Sub msg
