port module Ports exposing (..)


port requestSessionToken : () -> Cmd msg


port getSessionToken : (String -> msg) -> Sub msg


port encrypt : ( String, String, String ) -> Cmd msg


port getEncryption : (( String, String ) -> msg) -> Sub msg
