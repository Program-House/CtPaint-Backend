emailer = require "nodemailer"
secrets = require "../secrets.json"
r = require "rethinkdb"
db = r.db "ctpaint"


transporter = emailer.createTransport
    service: "gmail"
    auth: secrets.gmailAccount


module.exports.sendVerification = (to, code) ->

    options =
        from: "CtPaint <verification@ctpaint.us>"
        to: to
        subject: "Verify your CtPaint account"
        text: "DANK"

    transporter.sendMail options, (error, info) ->
        if error then console.log error
        console.log info

