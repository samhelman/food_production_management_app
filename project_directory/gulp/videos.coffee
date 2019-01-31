g = module.parent.exports

g.task "videos", ->

  g.src "../assets/videos/*"
    .pipe g.dest "../web/static/videos"
    .pipe g.sync.reload stream: true

