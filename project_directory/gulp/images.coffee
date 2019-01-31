g = module.parent.exports

g.task "images", ->
  # deferred = g.q.defer()

  g.src "../assets/images/*"
    # .pipe g.p.imagemin().on 'end', -> deferred.resolve()
    .pipe g.dest "../web/static/images"
    .pipe g.sync.reload stream: true

  # deferred.promise
