util = require "gulp-util"

module.exports.log = (a) ->
    util.log (util.colors.cyan "Server"), a