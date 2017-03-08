var app = Elm.Main.fullscreen();


app.ports.toJS.subscribe(function(thing) {
  console.log(thing);
})

function fromJS (thing) {
  app.ports.fromJS.send(thing);
}

