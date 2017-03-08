module Main.Util exposing (..)

import Navigation exposing (Location)


isPossible : Location -> Bool
isPossible location =
    List.member location.pathname possiblePaths


possiblePaths : List String
possiblePaths =
    [ "/"
    , "/login"
    , "/signup"
    , "/error"
    ]
