_ = require "lodash"

module.exports = (app, dbConnection) ->

  submodules = _.map [
    "./router/api"
    "./router/pages"
  ], require

  _.forEach submodules, (sm) ->
    sm app, dbConnection

