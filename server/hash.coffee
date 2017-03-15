_ = require "lodash"
sha = require "js-sha256"


module.exports.get = get = (password) ->
  sha password

module.exports.salt = salt = ->
  (_.times 32, randomCharacter).join ""

randomCharacter = ->
  alphanumeric[ randomIndex() ]

alphanumeric = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

randomIndex = ->
  Math.floor (Math.random() * (alphanumeric.length - 1))