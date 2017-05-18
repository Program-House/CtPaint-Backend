package Models


type Login struct {
    Username string
    Password string
}

type Registration struct {
    Username string
    Email string
    Password string
}


type User struct {
    Username string
    Email string
    Verified bool
    Frozen bool
    Hash string
    Salt string
    creationDate string    
}