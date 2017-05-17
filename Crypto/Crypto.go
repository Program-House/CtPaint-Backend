package crypto

import (
    . "crypto/sha512"
    "encoding/hex"
)

func Password(password string) string {
    hash := Sum512([]byte(password))

    return hex.EncodeToString(hash[:]);
}