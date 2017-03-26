module.exports.getString = ->

    buffer = new Uint8Array 32
    window.crypto.getRandomValues buffer

    hex = []
    buffer.forEach (num) ->
        hex.push (num.toString 16)

    hex.join ""