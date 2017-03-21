var _ = require("lodash");
var app = Elm.Main.fullscreen();
var cryptico = require("cryptico");


app.ports.requestSessionToken.subscribe(function() {

  if (typeof localStorage.sessionToken === "undefined") {
    var buffer = new Uint8Array(32);
    
    window.crypto.getRandomValues(buffer);
    
    var hex = [];
    buffer.forEach(function(num) {
      hex.push(num.toString(16));
    });

    var token = hex.join("");
    localStorage.setItem("sessionToken", token);

    app.ports.getSessionToken.send(token);
  } else {
    app.ports.getSessionToken.send(localStorage.sessionToken);
  }
});


app.ports.encrypt.subscribe(function(payload) {
  var plainText = payload[0];
  var publicKey = payload[1];

  var cipher = cryptico.encrypt(plainText, publicKey);

  if (cipher.status === "success") {
    app.ports.getEncryption.send(cipher.cipher);
  } else {
    console.log(cipher);
  }
})
