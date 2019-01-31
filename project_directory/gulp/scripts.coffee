g = module.parent.exports

g.task "scripts", ->
  g.src "../assets/js/*.js"
    .pipe g.js()
    .pipe g.p.concat "application.js"
    .pipe g.dest "../web/static/js"
    .pipe g.sync.reload stream: true
