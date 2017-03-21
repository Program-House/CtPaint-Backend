var _ = require("lodash");
var app = Elm.Main.fullscreen();
var cryptico = require("cryptico");
var sha = require("js-sha256");


app.ports.requestSessionKey.subscribe(function() {

  if (typeof localStorage.sessionHash !== "undefined") {
    var hash = localStorage.sessionHash;
    var rsa = cryptico.generateRSAKey(hash, 1024);
    var publicKey = cryptico.publicKeyString(rsa);
    app.ports.getSessionKey.send(publicKey);
  } else {
    var buf = new Uint8Array(32);
    window.crypto.getRandomValues(buf);

    var hex = []

    buf.forEach(function(num) {
      hex.push(num.toString(16));
    });

    var hash = sha(hex.join(""));
    localStorage.setItem("sessionHash", hash);
    var rsa = cryptico.generateRSAKey(hash, 1024);
    var publicKey = cryptico.publicKeyString(rsa);
    app.ports.getSessionKey.send(publicKey)
  }
});


app.ports.encrypt.subscribe(function(payload) {
  var msg = payload[0];
  var plainText = payload[1];
  var publicKey = payload[2];

  var cipher = cryptico.encrypt(plainText, publicKey);

  if (cipher.status === "success") {
    app.ports.encryption.send([ msg, cipher.cipher ]);
  } else {
    console.log(cipher);
  }
})
