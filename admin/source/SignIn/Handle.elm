module SignIn.Handle exposing (handle)

import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import Ports
import Json.Encode as Encode
import Api.PublicKey as PublicKey


handle : Model -> ( Model, Cmd Msg )
handle model =
    case ( model.sessionToken, model.publicKey ) of
        ( Just sessionToken, Just publicKey ) ->
            ( model
            , Ports.encrypt
                ( toRequest model sessionToken
                , publicKey
                )
            )

        _ ->
            ( model
            , Cmd.batch
                [ PublicKey.get
                , Ports.requestSessionToken ()
                ]
            )


toRequest : Model -> String -> String
toRequest model sessionToken =
    [ ( "username", Encode.string model.usernameField )
    , ( "password", Encode.string model.passwordField )
    , ( "sessionToken", Encode.string sessionToken )
    ]
        |> Encode.object
        |> Encode.encode 0
