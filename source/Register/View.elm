module Register.View exposing (view)

import Html exposing (Html)
import Html.Attributes exposing (class, style)
import Main.Message exposing (Msg(..), SignUpMsg(..))
import Main.Components
    exposing
        ( card
        , words
        , vectorWords
        , button
        )


view : Html Msg
view =
    card
        [ class "solitary" ]
        [ words "Something went wrong"
        , button "Register" False (SignUp Register)
        ]
