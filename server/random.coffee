_ = require "lodash"
sha = require "js-sha256"
crypto = require "crypto"

module.exports.hash = hash = (password) ->
  sha password

# module.exports.salt = salt = ->
#   (_.times 32, randomCharacter).join ""

# randomCharacter = ->
#   alphanumeric[ randomIndex() ]

# alphanumeric = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

# randomIndex = ->
#   Math.floor (Math.random() * (alphanumeric.length - 1))


module.exports.getString = getString = ->
  crypto
    .randomBytes 16
    .toString "hex"


#   function randomValueHex (len) {
#     return crypto.randomBytes(Math.ceil(len/2))
#         .toString('hex') // convert to hexadecimal format
#         .slice(0,len);   // return required number of characters
# }
