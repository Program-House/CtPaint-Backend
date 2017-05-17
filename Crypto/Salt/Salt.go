package salt


import (
    "math/rand"
    "time"
)


const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
const (
    indexBits = 6                // 6 bits to represent a letter index
    indexMask = 1<<indexBits - 1 // All 1-bits, as many as indexBits
    indexMax  = 63 / indexBits   // # of letter indices fitting in 63 bits
)

var src = rand.NewSource(time.Now().UnixNano())


func New() string {
    length := 16

    b := make([]byte, length)

    for i, cache, remain := length - 1, src.Int63(), indexMax; i >= 0; {
        if remain == 0 {
            cache, remain = src.Int63(), indexMax
        }

        if index := int(cache & indexMask); index < len(letters) {
            b[i] = letters[ index ]
            i--
        }

        cache >>= indexBits
        remain--
    }

    return string(b)
}
