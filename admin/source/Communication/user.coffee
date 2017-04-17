Root = require "./root"
Post = require "./post"

module.exports = (next) ->
    (payload) ->
        dest =
            Root.url "api/admin/user"

        body =
            field: payload[0]
            parameter: payload[1]

        Post dest, body, next
