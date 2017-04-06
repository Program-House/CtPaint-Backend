module Components.DropDown exposing (view)

import Html exposing (Html)
import Main.Message exposing (Message(..), Handler)
import Components.DropDown.Basics as DropDown


view : Bool -> Message -> Handler a -> a -> List a -> Html Message
view dropped drop parameterHandler currentParameter parameters =
    let
        wrap_ =
            wrap drop currentParameter
    in
        if dropped then
            wrap_ [ DropDown.options parameterHandler parameters ]
        else
            wrap_ []


wrap : Message -> a -> List (Html Message) -> Html Message
wrap dropMessage parameter options =
    options
        |> List.append
            [ DropDown.words parameter
            , DropDown.button dropMessage
            ]
        |> DropDown.container
