module Main.Model exposing (Model)

import Main.Message exposing (Message(..))
import Main.Types exposing (Page(..))


type alias Model =
    { page : Page }
