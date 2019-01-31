g = module.parent.exports

g.task "watch", ->
  g.sync
    proxy: "ras"
    open: false
    notify: false
    reloadOnRestart: true

  g.watch "../main_app/static/custom/js/*.js", ["scripts"]
  g.watch "../main_app/static/custom/css/*.css", ["styles"]
