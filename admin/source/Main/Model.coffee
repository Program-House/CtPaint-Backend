module.exports.state = state =
    rsa: {}
    serversKey: ""
    clientsKey: ""
    sessionToken: ""


module.exports.setState = (key, value) ->
    if key of state
        state[ key ] = value
    else
        console.error "State doesnt have the property", key

