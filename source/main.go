
package main

import (
    "log"
    "net/http"
    "os"
    . "./types"
    Router "./router"
    "database/sql"
    _ "github.com/go-sql-driver/mysql"
)

var db *sql.DB 
var (
    port = "2976"
    ip = "localhost"
)


func main() {

    server := Server{
        Host: ip,
        Port: port,
        Logger: log.New(os.Stdout, "server> ", log.Ltime|log.Lshortfile),
    }

    Router.SetUp()
    Serve(server)
}


func Serve(server Server) {

    listenString := server.Host + ":" + server.Port
    server.Logger.Println("Serving http://" + listenString)
    server.Logger.Fatal(http.ListenAndServe(listenString, nil))
}


