var cryptico = require("cryptico");
var app = Elm.Main.fullscreen();

app.ports.encrypt.subscribe(function(payload) {
  var msg = payload[0];
  var plainText = payload[1];
  var publicKey = payload[2];

  var cipher = cryptico.encrypt(plainText, publicKey);

  if (cipher.status === "success") {
    encryption([ msg, cipher.cipher ]);
  } else {
    console.log(cipher);
  }
})

function encryption (thing) {
  app.ports.encryption.send(thing);
}

