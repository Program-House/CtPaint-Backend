package types

import (
    "log"
)


type Server struct {
    Host string
    Port string
    Logger *log.Logger
}


type Session struct {
    expires int
    token string
}

type Admin struct {
    session Session
    username string
    hash string
    key string
}

type User struct {
    username string
    email string
    verified bool
    frozen bool
    hash string
    salt string
}

type Test struct {
    Content string
}