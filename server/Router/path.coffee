module.exports = path = (base) ->
    nextPath = (to) ->
        path (base + "/" + to)
    nextPath.get = base
    nextPath