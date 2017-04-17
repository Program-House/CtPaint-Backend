Root = require "./root"
Post = require "./post"
Model = require "./model"


module.exports = (next) ->
    (payload) ->

        dest =
            Root.url "api/admin/signin"

        body =
            username: payload[0]
            password: payload[1]

        Post dest, body, (json) -> 
            if json.msg is "success"
                next payload[0]

