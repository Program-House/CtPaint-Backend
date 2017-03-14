module SuccessfulRegister.View exposing (view)

import Html exposing (Html)
import Html.Attributes exposing (class)
import Main.Message exposing (Msg)
import Main.Components exposing (card, words)


view : String -> Html Msg
view email =
    card
        [ class "solitary register-success" ]
        [ words <| "You are registered! One last thing, you need to verify your email address. " ++ email ++ " should get an email containing your verifcation link. Click that link and you are good to go." ]
