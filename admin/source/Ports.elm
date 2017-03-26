port module Ports exposing (..)


port saveServersKey : String -> Cmd msg


port makeClientKey : () -> Cmd msg


port signIn : ( String, String ) -> Cmd smg


port post : (( String, String ) -> msg) -> Sub msg


port signInResult : (Bool -> msg) -> Sub msg



--port requestSessionToken : () -> Cmd msg
--port getSessionToken : (String -> msg) -> Sub msg
--port requestPublicKey : () -> Cmd msg
--port getPublicKey : (String -> msg) -> Sub msg
--port encrypt : ( String, String ) -> Cmd msg
--port getEncryption : (String -> msg) -> Sub msg
--port decrypt : String -> Cmd msg
--port getPlaintext : (String -> msg) -> Sub msg
