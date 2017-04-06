module SignIn.Update exposing (update)

import Main.Model exposing (Model)
import Main.Message exposing (Message(..))
import Main.Types exposing (Page(..))
import SignIn.Message exposing (SignInMessage(..))
import SignIn.Model as SignIn
import Ports
import Json.Decode as Json
import Debug exposing (log)


update : SignInMessage -> SignIn.Model -> Model -> ( Model, Cmd Message )
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

        HandleEnter ->
            update SignIn signInModel model


packPage : Model -> List (Cmd Message) -> SignIn.Model -> ( Model, Cmd Message )
packPage model cmds signInModel =
    { model
        | page = SignInPage signInModel
    }
        ! cmds


submit : SignIn.Model -> Model -> ( Model, Cmd Message )
submit { usernameField, passwordField } model =
    if usernameField /= "" && passwordField /= "" then
        ( model, Ports.signIn ( usernameField, passwordField ) )
    else
        ( model, Cmd.none )
