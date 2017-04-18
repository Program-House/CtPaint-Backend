_ = require "lodash"
join = (require "path").join
app = (require "../Main").getApp()


homeAppPaths = [
    "/"
    "/register"
]

homeApp = (req, res) ->
    home = join __dirname, "../../home/development/index.html"
    (res.status 200).sendFile home


module.exports = ->

    _.forEach homeAppPaths, (path) -> app.get path, homeApp

    app.get "/app", (req, res) ->
        paint = join __dirname, "../../paint/development/index.html"
        (res.status 200).sendFile paint

