package main

import "github.com/go-martini/martini"
import "io/ioutil"



func main() {
    m := martini.Classic()

    m.Use(martini.Static("./"))
    
    m.Get("/", func() string {
        s, err := ioutil.ReadFile("./index.html")

        if (err == nil) {
            return string(s)
        } else {
            return "DOP"
        }

        // return string(s)
    // return "<html><body><h1>weeewoo</h1></body></html>"
    })
    m.Run()
}