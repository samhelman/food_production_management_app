g = module.parent.exports
del = require("del")

g.task "clean", (cb) ->
  del ["./web/static/{css,fonts,images,js,videos}"], cb
