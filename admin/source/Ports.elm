port module Ports exposing (..)


port requestSessionKey : () -> Cmd msg


port getSessionKey : (String -> msg) -> Sub msg


port encrypt : ( String, String, String ) -> Cmd msg


port encryption : (( String, String ) -> msg) -> Sub msg
