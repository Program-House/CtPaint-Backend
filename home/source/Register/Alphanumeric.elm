module Register.Alphanumeric exposing (is, isNumeric)


is : Char -> Bool
is char =
    String.contains
        (String.fromChar char)
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvxwyz0123456789"


isNumeric : Char -> Bool
isNumeric char =
    String.contains
        (String.fromChar char)
        "0123456789"
