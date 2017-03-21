module Api.SignIn exposing (signIn)

import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import Json.Decode as Decode
import Json.Encode as Encode
import Api.Util as Api
import Http


signIn : String -> Cmd Msg
signIn cipher =
    Http.send SignInResult (post cipher)


post : String -> Http.Request Decode.Value
post cipher =
    Http.post
        (Api.root "/api/admin/login")
        (toBody cipher)
        Decode.value


toBody : String -> Http.Body
toBody =
    Encode.string
        >> (,) "cipher"
        >> List.singleton
        >> Encode.object
        >> Http.jsonBody
