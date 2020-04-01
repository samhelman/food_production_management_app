// packages
const fs = require("fs");
const glob = require("glob");
const path = require("path");

// config
const assetsDirs = [
  {
    src: "../main_app/static/custom/js/",
    dist: "../web/static/js",
    file_name: "/application.js",
    force: true
  },
  {
    src: "../main_app/static/custom/css/",
    dist: "../web/static/css",
    file_name: "/application.css",
    force: true
  }
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
    let files = glob.sync(`${sourceDir}/**/*`, { nodir: true });

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
