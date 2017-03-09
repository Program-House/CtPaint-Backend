module Register.View exposing (view)

import Html exposing (Html)
import Html.Attributes exposing (class, style)
import Register.Model exposing (RegisterModel)
import Register.Message exposing (RegisterMsg(..))
import Register.Button as Button
import Main.Message exposing (Msg(..))
import Main.Components exposing (card, words)


view : RegisterModel -> Html Msg
view model =
    card
        [ class "solitary" ]
        [ words "Register new CtPaint Account"
        , Button.view model.problems
        ]
