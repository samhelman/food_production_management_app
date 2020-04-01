// Load plugins
const gulp = require("gulp");

// import tasks

const server = require("./browsersync.js");
const clean = require("./clean.js");

//copy all js and css files inside custom into one file for each (application.js and application.css)
const copy = require("./copy.js");
// copy all js and css files of library into one file for each (vendor.js and framework.css)
const copy_libraries = require("./copy_libraries.js");
//these are files that can't be merged into one
const copy_one_to_one = require("./copy_one_to_one.js");

// Watch files
function watchFiles() {
  gulp.watch("../main_app/static/custom/js/*.js", gulp.series(clean.custom, copy.assets));
  gulp.watch("../main_app/static/custom/css/*.css", gulp.series(clean.custom, copy.assets));

}

// define tasks
const watch = gulp.parallel(watchFiles, server.init);
const build = gulp.series(
  clean.dist,
  gulp.parallel(copy_one_to_one.assets),
  gulp.parallel(copy_libraries.assets),
  gulp.parallel(copy.assets),
    watch
);

// expose tasks to CLI
exports.watch = watch;
exports.default = build;
