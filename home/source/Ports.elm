port module Ports exposing (..)


port encrypt : ( String, String, String ) -> Cmd msg


port encryption : (( String, String ) -> msg) -> Sub msg
