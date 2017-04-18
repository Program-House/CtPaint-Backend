_ = require "lodash"
sha = require "js-sha256"
crypto = require "crypto"

module.exports.hash = hash = (password) ->
    sha password

module.exports.getString = getString = ->
    crypto
        .randomBytes 16
        .toString "hex"


