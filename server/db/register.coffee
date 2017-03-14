r = require "rethinkdb"
_ = require "lodash"
sha = require "js-sha256"

# module.exports = (req) ->
#   salt = makeSalt()


  # r.db "ctpaint"
  #   .table "user"
  #   .insert 
  
module.exports.hash = hash = (password) ->
  sha password

module.exports.makeSalt = makeSalt = ->
  (_.times 32, randomCharacter).join ""

module.exports.randomCharacter = randomCharacter = ->
  alphanumeric[ randomIndex() ]

alphanumeric = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

randomIndex = ->
  Math.floor (Math.random() * (alphanumeric.length - 1))