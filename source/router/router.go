package router

import "github.com/go-martini/martini"
import "io/ioutil"


func Make(m *martini.ClassicMartini) {
    m.Get("/", func() string {
        s, err := ioutil.ReadFile("./apps/test.html")

        if err == nil {
            return string(s)
        } else {
            return "dank memes"
        }
    })
}