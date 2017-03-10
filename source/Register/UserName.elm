module Register.UserName exposing (..)

import Html exposing (Html)
import Main.Message exposing (Msg(..))
import Register.Components as Components
import Register.Message exposing (RegisterMsg(..))
import Register.Model exposing (RegisterModel)


field : String -> String -> ( String, Bool ) -> Html Msg
field labelText placeholder_ ( fieldContent, taken ) =
    Components.field
        labelText
        placeholder_
        fieldContent
        (RegisterWrapper << UpdateUserNameField)


handle : String -> RegisterModel -> RegisterModel
handle username model =
    { model
        | username = ( username, Tuple.second model.username )
    }
