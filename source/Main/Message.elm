module Main.Message
    exposing
        ( Msg(..)
        , SignUpMsg(..)
        )

import Navigation exposing (Location)


type Msg
    = UrlChange Location
    | GoHome
    | SignUp SignUpMsg


type SignUpMsg
    = Register
    | CheckIfValid
