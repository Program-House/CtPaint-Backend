package main

import "github.com/go-martini/martini"
import router "./router"
// import "fmt"


func main() {
    m := martini.Classic()

    router.Make(m)

    m.Run()
}

