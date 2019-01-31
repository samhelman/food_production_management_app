g = module.parent.exports

g.task "vendor", ->
  g.src [
   "/node_modules/jquery/dist/jquery.min.js",
    "/node_modules/tether/dist/js/tether.min.js",
    "/node_modules/tablesaw/dist/tablesaw.jquery.js",
    "/node_modules/tablesaw/dist/tablesaw-init.js",
    "/node_modules/snackbarjs/dist/snackbar.min.js",
    "/node_modules/moment/moment.js",
    "/node_modules/popper.js/dist/umd/popper.min.js",
    "/node_modules/eonasdan-bootstrap-datetimepicker/src/js/bootstrap-datetimepicker.js",
    "/node_modules/jquery-ui-dist/jquery-ui.min.js",
    "/node_modules/bootstrap-material-design/dist/js/bootstrap-material-design.min.js",
  ]
    .pipe g.js()
    .pipe g.p.concat "vendor.js"
    .pipe g.dest "../web/static/js"
    .pipe g.sync.reload stream: true

