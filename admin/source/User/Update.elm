module User.Update exposing (update)

import User.Message exposing (UserMessage(..))
import Main.Model exposing (Model)
import Main.Message exposing (Message(..))
import Main.Types exposing (Page(..))
import User.Model as User


update : UserMessage -> User.Model -> Model -> ( Model, Cmd Message )
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

        HandleEnter ->
            packPage model [] state

        DropSearchParameters ->
            { state
                | searchParameterDropped =
                    not state.searchParameterDropped
            }
                |> packPage model []

        SetDropDown parameter ->
            { state
                | searchParameter = parameter
                , searchParameterDropped = False
            }
                |> packPage model []


packPage : Model -> List (Cmd Message) -> User.Model -> ( Model, Cmd Message )
packPage model cmds userModel =
    { model
        | page = UsersPage userModel
    }
        ! cmds
