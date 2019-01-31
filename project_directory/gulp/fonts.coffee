g = module.parent.exports

g.task "fonts", ->
  g.src ["assets/fonts/*", "/node_modules/font-awesome/fonts/*"]
    .pipe g.p.flatten()
    .pipe g.dest "../web/static/fonts"
    .pipe g.sync.reload stream: true
