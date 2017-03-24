module User.Update exposing (update)

import User.Message exposing (UserMsg(..))
import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import Main.Types exposing (Page(..))
import User.Model as User


update : UserMsg -> User.Model -> Model -> ( Model, Cmd Msg )
update userMessage state model =
    case userMessage of
        UpdateUsernameField str ->
            { state
                | usernameField = str
            }
                |> packPage model []

        UpdateSearchField str ->
            { state
                | searchField = str
            }
                |> packPage model []

        HandleEnter True ->
            packPage model [] state

        HandleEnter False ->
            packPage model [] state


packPage : Model -> List (Cmd Msg) -> User.Model -> ( Model, Cmd Msg )
packPage model cmds userModel =
    { model
        | page = UsersPage userModel
    }
        ! cmds
