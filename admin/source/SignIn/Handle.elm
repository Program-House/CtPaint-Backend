module SignIn.Handle exposing (handle)

import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import Ports
import Json.Encode as Encode
import Api.PublicKey as PublicKey


handle : Model -> ( Model, Cmd Msg )
handle model =
    case (packKeys model) of
        ( Just clientsKey, Just token, Just serversKey ) ->
            ( model
            , Ports.encrypt
                ( toRequest model token clientsKey
                , serversKey
                )
            )

        _ ->
            ( model
            , Cmd.batch
                [ PublicKey.get
                , Ports.requestSessionToken ()
                ]
            )


packKeys : Model -> ( Maybe String, Maybe String, Maybe String )
packKeys model =
    ( model.clientsPublicKey
    , model.sessionToken
    , model.serversPublicKey
    )


toRequest : Model -> String -> String -> String
toRequest model sessionToken clientsPublicKey =
    [ ( "username", Encode.string model.usernameField )
    , ( "password", Encode.string model.passwordField )
    , ( "sessionToken", Encode.string sessionToken )
    , ( "publicKey", Encode.string clientsPublicKey )
    ]
        |> Encode.object
        |> Encode.encode 0
