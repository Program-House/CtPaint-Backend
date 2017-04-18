_ = require "lodash"
join = (require "path").join
app = (require "../Main").getApp()


homeAppPaths = [
  "/"
  "/register"
]

homeApp = (req, res) ->
  (res.status 200).sendFile (join __dirname, "../../home/development/index.html")


module.exports = ->

  _.forEach homeAppPaths, (path) -> app.get path, homeApp

  app.get "/app", (req, res) ->
    (res.status 200).sendFile (join __dirname, "../../paint/development/index.html")

