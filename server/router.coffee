_ = require "lodash"

module.exports = ->
  submodules = _.map [
    "api"
    "pages"
  ], (sm) -> require ("./router/" + sm)

  _.forEach submodules, (sm) -> sm()

