package SignIn

import (
    "net/http"
    "fmt"
    . "../../../types"
    "encoding/json"
)


func SignIn(res http.ResponseWriter, req *http.Request) {
    switch req.Method {
    case "POST":
        decoder := json.NewDecoder(req.Body)

        var test Test
        err := decoder.Decode(&test)
        if err == nil {
            fmt.Println(test.Content)
        } else {
            fmt.Println(err)
        }
    }
}