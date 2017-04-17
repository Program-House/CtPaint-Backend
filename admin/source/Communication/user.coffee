Root = require "./root"
Post = require "./post"
Model = require "./model"


module.exports = (next) ->
    (payload) ->
        
        dest =
            Root.url "api/admin/user"

        body =
            field: payload[0]
            parameter: payload[1]
            username: Model.state.username

        Post dest, body, -> next true
