// packages
const fs = require("fs");
const glob = require("glob");
const path = require("path");

// config
const assetsDirs = [
   /* {
        src: [
            "/node_modules/jquery/dist/jquery.min.js",
            "/node_modules/tether/dist/js/tether.min.js",
            "/node_modules/tablesaw/dist/tablesaw.jquery.js",
            "/node_modules/tablesaw/dist/tablesaw-init.js",
            "/node_modules/snackbarjs/dist/snackbar.min.js",
            "/node_modules/moment/moment.js",
            "/node_modules/eonasdan-bootstrap-datetimepicker/src/js/bootstrap-datetimepicker.js",
            "/node_modules/jquery-ui-dist/jquery-ui.min.js",
            "/node_modules/bootstrap-material-design/dist/js/bootstrap-material-design.min.js",
            "/node_modules/bootstrap-select/dist/js/bootstrap-select.min.js"
        ],
        dist: "../web/static/js",
        file_name: "/vendor.js",
        force: true
    },
    {
        src: [
            "/node_modules/snackbarjs/dist/snackbar.css",
            "/node_modules/bootstrap/dist/css/bootstrap.min.css",
            "/node_modules/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css",
            "/node_modules/tablesaw/dist/tablesaw.css",
            "/node_modules/jquery-ui-dist/jquery-ui.min.css",
            "/node_modules/jquery-ui-dist/jquery-ui.structure.min.css",
            "/node_modules/jquery-ui-dist/jquery-ui.theme.min.css",
            "/node_modules/jquery-ui-dist/jquery-ui.css",
            "/node_modules/font-awesome/css/font-awesome.min.css",
            "/node_modules/jquery-ui-dist/jquery-ui.min.css",
            "/node_modules/bootstrap-material-design/dist/css/bootstrap-material-design.min.css",
            "/node_modules/bootstrap-select/dist/css/bootstrap-select.min.css",
        ],
        dist: "../web/static/css",
        file_name: "/framework.css",
        force: true
    }*/

];

// make sure paths do not end with slash
function sanitizePath(filepath) {
  let sanitizedFilepath = filepath;
  if (filepath.slice(-1) === "/") {
    sanitizedFilepath = filepath.slice(0, -1);
  }
  return sanitizedFilepath;
}

// copy assets
function copyAssets(done) {
  assetsDirs.forEach(dir => {
    // src and dist
    let sourceDir = sanitizePath(dir.src);
    let distDir = sanitizePath(dir.dist);
    // glob all files
    let files = dir.src;

    // copy each file to dist dir

    files.forEach(function(file) {
      let srcFile = file;
      let distFile = srcFile.replace(sourceDir, distDir);
      let distDirname = path.dirname(distFile);

      fs.readFile(file, (err, data) => {
        if (err) throw err;
        fs.appendFile(dir.dist+dir.file_name,data, (err) => {
            if (err) throw err;
          });
      });

    });
  });
  done();
}

// exports
module.exports = {
  assets: copyAssets
};
