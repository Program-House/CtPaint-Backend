module Api.Util exposing (root)


root : String -> String
root path =
    if dev then
        "http://localhost:2984" ++ path
    else
        "??? ? ? ??? ?" ++ path


dev : Bool
dev =
    True
