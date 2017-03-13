var fs = require('fs');
var express = require('express');
var app = express();
var http = require('http');
var join = require('path').join;
var bodyParser = require('body-parser');
var passport = require('passport');
var Strategy = require('passport-local').Strategy;
var r = require("rethinkdb");


var dbConnection = null;
var PORT = 2984;
var log = console.log;

r.connect({host: 'localhost', port: 28015}, function(err, conn) {
  if (err) throw err;
  connection = conn;
  log("Connected to database");
});


passport.use(new Strategy(
  function(username, password, callback) {
    log("cool", username, password);
  }
));


app.use(bodyParser.json());
app.use(express.static(join(__dirname, '/development')));

app.use(passport.initialize());
app.use(passport.session());


app.get('/*', function(req, res, next) {
  var indexPage = join(__dirname, 'development/index.html');
  return res.status(200).sendFile(indexPage);
})


app.post("/api/register", function(req, res, next) {
  log("Req.body", req.body);

  r.db("ctpaint").table("user").insert([
    Object.assign({}, req.body, { verified: false })
  ]).run(connection, function(err, result) {

  })

  return res.status(200);
});


app.post("/api/login", 
  passport.authenticate("local", { failureRedirect: "/login" }), 
  function( req, res ) {
    res.redirect("/");
  }
);


var httpServer = http.createServer(app);

httpServer.listen(PORT, function(){
  log("Server running on ", PORT);
})

