Register = require "./User/register"

module.exports = (path, app, dbConnection) ->

    Register (path "register"), app, dbConnection