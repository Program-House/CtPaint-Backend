package types

import (
    "log"
)


type Server struct {
    Host string
    Port string
    Logger *log.Logger
}