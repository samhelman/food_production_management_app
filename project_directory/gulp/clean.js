// packages
const del = require("del");

// Clean
function cleanDist() {
  return del(["../web/static/{css,fonts,images,js,videos}/*"],{'force':true});
}

// Clean
function cleanCustom() {
  return del("../web/static/css/application.css",{'force':true});
  return del("../web/static/js/application.js",{'force':true});
}

// exports
module.exports = {
  dist: cleanDist,
    custom: cleanCustom
};
