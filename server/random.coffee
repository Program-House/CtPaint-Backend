sha = require "js-sha256"
crypto = require "crypto"

module.exports.hash = (password) ->
    sha password

module.exports.getString = ->
    crypto
        .randomBytes 16
        .toString "hex"


