// packages
const fs = require("fs");
const glob = require("glob");
const path = require("path");

// config
const assetsDirs = [
  {
    src: "/node_modules/font-awesome/fonts/",
    dist: "../web/static/fonts",
    force: true
  },
    {
    src: "../main_app/static/custom/images/",
    dist: "../web/static/images",
    force: true
  },
    {
    src: "../main_app/static/custom/sound/",
    dist: "../web/static/sound",
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
      fs.copyFileSync(srcFile, distFile);
    });
  });
  done();
}

// exports
module.exports = {
  assets: copyAssets
};
