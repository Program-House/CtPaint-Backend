module Main.Url exposing (handle)

import Navigation exposing (Location)
import Main.Model exposing (Model, PageState(ErrorState))
import Main.Message exposing (Msg(..))


handle : Location -> Model -> ( Model, Cmd Msg )
handle location model =
    if isPossible location then
        { model
            | location =
                location
                --, pageState = getPageState
        }
            ! []
    else
        { model
            | pageState = ErrorState "Page does not exist"
        }
            ! [ Navigation.newUrl "error" ]


isPossible : Location -> Bool
isPossible location =
    List.member location.pathname possiblePaths


possiblePaths : List String
possiblePaths =
    [ "/"
    , "/login"
    , "/register"
    , "/error"
    ]
