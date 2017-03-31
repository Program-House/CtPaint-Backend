_ = require "lodash"

module.exports = (app, dbConnection) ->

  submodules = _.map [
    "api"
    "pages"
  ], (sm) -> require ("./router/" + sm)

  _.forEach submodules, (sm) ->
    sm app, dbConnection

