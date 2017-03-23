module User.Update exposing (update)

import User.Message exposing (UserMsg(..))
import Main.Model exposing (Model)
import Main.Message exposing (Msg(..))
import Main.Types exposing (Page(..))
import User.Model as User


update : UserMsg -> User.Model -> Model -> ( Model, Cmd Msg )
update userMessage state model =
    ( model, Cmd.none )



--case userMessage of
--    UpdateUsernameField str ->
--        { model
--            | page =
--                UsersPage
--                    { state
--                        | usernameField = str
--                    }
--        }
--            ! []
