SignIn = require "./Admin/sign-in"
User = require "./Admin/user-search"

module.exports = (path, app, dbConnection) ->

    SignIn (path "signin"), app, dbConnection
    User (path "user"), app, dbConnection