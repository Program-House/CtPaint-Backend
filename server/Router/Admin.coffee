SignIn = require "./Admin/sign-in"
User = require "./Admin/user-search"

module.exports = (path) ->

    SignIn (path "signin")
    User (path "user")