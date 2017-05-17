package main

import (
	"log"
	"os"

	"github.com/gin-gonic/gin"

	_ "github.com/lib/pq"
	"database/sql"
	Auth "github.com/Program-House/CtPaint-Backend/Auth"
)


var (
    db *sql.DB
)


func main() {
	port := os.Getenv("PORT")

	if port == "" {
		log.Fatal("$PORT must be set")
	}

	var err error
	db, err = sql.Open("postgres", os.Getenv("DATABASE_URL"))
    if err != nil {
        log.Fatalf("Error opening database: %q", err)
    }

	router := gin.New()
	router.Use(gin.Logger())

	Auth.Set(router)

	router.Run(":" + port)
}
