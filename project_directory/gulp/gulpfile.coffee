g = module.exports = require("gulp")
g.e = process.env.NODE_ENV || "dev"
g.p = require("gulp-load-plugins")()
g.q = require("q")
g.sync = require("browser-sync")

lazy = require("lazypipe")
rev = (d) -> d.getFullYear() + z(d.getMonth() + 1) + z(d.getDate()) + z(d.getHours()) + z(d.getMinutes())
z = (x) -> ("0" + x).slice -2

g.css = lazy()
  .pipe g.p.include

g.js = lazy()
  .pipe g.p.include

if g.e != "dev"
  g.css = g.css.pipe g.p.minifyCss
  g.js  = g.js.pipe g.p.uglify

g.reload = lazy().pipe g.p.livereload, g.s
require("fs").readdirSync("./").forEach (task) -> require "./#{task}"
