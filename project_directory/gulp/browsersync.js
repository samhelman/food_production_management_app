// packages
const browsersync = require("browser-sync").create();

// BrowserSync
function init(done) {
  browsersync.init({
    server: "./dist/",
    files: [
      "../web/static/css/*.css",
      "../web/static/js/*.js"
    ],
    port: 3000,
    open: false
  });
  done();
}

// exports
module.exports = {
  init: init
};
