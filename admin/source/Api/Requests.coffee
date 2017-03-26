module.exports.post = (to, body, next) ->
    request = new XMLHttpRequest()
    request.open "POST", to, true
    request.setRequestHeader "Content-type", "application/json"

    request.onreadystatechange = ->
        if request.readyState is 4 and request.status is 200
            next (JSON.parse request.responseText).cipher

    request.send body