package auth

import (
    "fmt"
    "net/http"
    "github.com/gin-gonic/gin"
)

type Login struct {
    User string
    Password string
}

func Set(router *gin.Engine) {

    router.GET("/auth", func(c *gin.Context) {
        c.String(http.StatusOK, "Authorized! Yeah!")
    })

    router.POST("/auth", func(c *gin.Context) {
        var json Login
        if c.BindJSON(&json) == nil {
            fmt.Println(json)
        }
    })

}