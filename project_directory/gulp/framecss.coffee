g = module.parent.exports

g.task "framecss", ->
  g.src [
    "/node_modules/snackbarjs/dist/snackbar.css",
    "/node_modules/bootstrap/dist/css/bootstrap.min.css"
    "/node_modules/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css",
    "/node_modules/tablesaw/dist/tablesaw.css",
    "/node_modules/jquery-ui-dist/jquery-ui.min.css",
    "/node_modules/jquery-ui-dist/jquery-ui.structure.min.css",
    "/node_modules/jquery-ui-dist/jquery-ui.theme.min.css",
    "/node_modules/jquery-ui-dist/jquery-ui.css",
    "/node_modules/font-awesome/css/font-awesome.min.css",
    "/node_modules/jquery-ui-dist/jquery-ui.min.css",
    "/node_modules/bootstrap-material-design/dist/css/bootstrap-material-design.min.css",
  ]
    .pipe g.p.sass style: "expanded", errLogToConsole: g.e == 'dev'
    .pipe g.css()
    .pipe g.p.concat "framework.css"
    .pipe g.dest "../web/static/css"
    .pipe g.sync.reload stream: true

