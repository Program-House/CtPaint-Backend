port module Ports exposing (..)


port requestSessionToken : () -> Cmd msg


port getSessionToken : (String -> msg) -> Sub msg


port requestPublicKey : () -> Cmd msg


port getPublicKey : (String -> msg) -> Sub msg


port encrypt : ( String, String ) -> Cmd msg


port getEncryption : (String -> msg) -> Sub msg


port decrypt : String -> Cmd msg


port getPlaintext : (String -> msg) -> Sub msg
