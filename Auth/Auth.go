package auth


import (
    "fmt"
    "net/http"
    "github.com/gin-gonic/gin"
    Hash "github.com/Program-House/CtPaint-Backend/Crypto/Hash"
    Salt "github.com/Program-House/CtPaint-Backend/Crypto/Salt"
    Models "github.com/Program-House/CtPaint-Backend/Auth/Models"
    "time"
    "database/sql"
)



func Set(db *sql.DB, router *gin.Engine) {

    router.GET("/auth", func(c *gin.Context) {
        c.String(http.StatusOK, "Authorized! Yeah!")
    })

    router.POST("/api/register", func(c *gin.Context) {
        var json Models.Registration
        var err error
        err = c.BindJSON(&json);

        salt := Salt.New()

        if err == nil {
            result, err := db.Exec(
                "INSERT INTO users(email, username, verified, frozen, hash, salt, creation_date) VALUES($1, $2, $3, $4, $5, $6, $7)",
                json.Email,
                json.Username,
                false,
                false,
                Hash.Password(salt + json.Password),
                salt,
                time.Now().String(),
            )

            fmt.Println(err)
            fmt.Println(result)
        } else {
            fmt.Println(err)
        }

    })