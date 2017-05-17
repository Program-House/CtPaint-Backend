package auth


import (
    "fmt"
    "net/http"
    "github.com/gin-gonic/gin"
    // . "crypto/sha512"
    Hash "../Crypto/Hash"
    Salt "../Crypto/Salt"
    Models "./Models"
)



func Set(router *gin.Engine) {

    router.GET("/auth", func(c *gin.Context) {
        c.String(http.StatusOK, "Authorized! Yeah!")
    })

    router.POST("/auth", func(c *gin.Context) {
        var json Models.Login
        if c.BindJSON(&json) == nil {
            // fmt.
            fmt.Println(Hash.Password(json.Password))
            fmt.Println(Salt.New())
            fmt.Println(json)
        }
    })

}

// func hashpassword(password string) string