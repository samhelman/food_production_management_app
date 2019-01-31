g = module.parent.exports

g.task "css", ->
  g.src "../assets/css/*.css"
    .pipe g.css()
    .pipe g.p.concat "application.css"
    .pipe g.dest "../web/static/css"
    .pipe g.sync.reload stream: true
