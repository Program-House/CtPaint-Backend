join = (require "path").join
user = require "./db/user"
key = require "./public-key"

module.exports = (app, dbConnection) ->
  app.get "/", (req, res, next) ->
    (res.status 200).sendFile (join __dirname, "../home/development/index.html")

  app.post "/api/register", (req, res, next) ->
    user.new_ dbConnection, req.body, (pack) ->
      res.send (JSON.stringify pack)

  app.get "/api/key", (req, res, next) ->
    res.send key


