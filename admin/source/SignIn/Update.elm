module SignIn.Update exposing (update)

import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import Main.Types exposing (Page(..))
import SignIn.Message exposing (SignInMsg(..))
import SignIn.Model as SignIn
import Ports
import Json.Decode as Json
import Debug exposing (log)


update : SignInMsg -> SignIn.Model -> Model -> ( Model, Cmd Msg )
update signInMessage signInModel model =
    case signInMessage of
        UpdateUsernameField str ->
            { signInModel
                | usernameField = str
            }
                |> packPage model []

        UpdatePasswordField str ->
            { signInModel
                | passwordField = str
            }
                |> packPage model []

        SignIn ->
            submit signInModel model

        HandleEnter True ->
            update SignIn signInModel model

        HandleEnter False ->
            ( model, Cmd.none )


packPage : Model -> List (Cmd Msg) -> SignIn.Model -> ( Model, Cmd Msg )
packPage model cmds signInModel =
    { model
        | page = SignInPage signInModel
    }
        ! cmds


submit : SignIn.Model -> Model -> ( Model, Cmd Msg )
submit { usernameField, passwordField } model =
    if usernameField /= "" && passwordField /= "" then
        ( model, Ports.signIn ( usernameField, passwordField ) )
    else
        ( model, Cmd.none )
