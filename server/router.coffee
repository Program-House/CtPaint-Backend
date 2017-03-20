api = require "./router/api"
pages = require "./router/pages"

module.exports = (app, dbConnection) ->

  api app, dbConnection
  
  pages app, dbConnection

