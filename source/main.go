
package main

import (
    "io"
    "log"
    "net/http"
    "os"
    "io/ioutil"
)

var (
    port = "2976"
    ip = "localhost"
)


type Server struct {
    ListenHost string
    ListenPort string
    Logger     *log.Logger
}


func main() {

    server := Server{
        ListenHost: ip,
        ListenPort: port,
        Logger:     log.New(os.Stdout, "server> ", log.Ltime|log.Lshortfile)}

    http.HandleFunc("/", server.HandleIndex)

    server.Serve()
}


func (server *Server) Serve() {

    listenString := server.ListenHost + ":" + server.ListenPort
    server.Logger.Println("Serving http://" + listenString)
    server.Logger.Fatal(http.ListenAndServe(listenString, nil))
}


func (server *Server) HandleIndex(res http.ResponseWriter, req *http.Request) {
    server.httpHeaders(res)
    webpage, err := ioutil.ReadFile("./apps/test.html")

    if err == nil {
        io.WriteString(res, string(webpage))  
    } else {
        io.WriteString(res, "Error!")
    }
}


func (s *Server) httpHeaders(res http.ResponseWriter) {
    res.Header().Set("Content-Type", "text/html; charset=UTF-8")
}


