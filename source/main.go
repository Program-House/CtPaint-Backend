package main

import "github.com/go-martini/martini"
import "io/ioutil"
import "fmt"


func main() {
    m := martini.Classic()

    // m.Use(martini.Static("./"))
    
    m.Get("/", func() string {
        s, err := ioutil.ReadFile("./apps/test.html")

        fmt.Println(err)

        if (err == nil) {
            return string(s)
        } else {
            return "dank memes"
        }
    })

    
    m.Run()
}