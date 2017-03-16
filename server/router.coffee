_ = require "lodash"
join = (require "path").join
user = require "./db/user"
key = require "./public-key"

homeAppPaths = [
  "/"
  "/register"
]

homeApp = (req, res) ->
  (res.status 200).sendFile (join __dirname, "../home/development/index.html")

module.exports = (app, dbConnection) ->

  _.forEach homeAppPaths, (path) -> app.get path, homeApp

  app.post "/api/register", (req, res) ->
    user.new_ dbConnection, req.body, (pack) ->
      res.send (JSON.stringify pack)

  app.get "/api/key", (req, res) ->
    res.send key


