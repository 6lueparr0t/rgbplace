'use strict';

const fs          = require('fs');
const del         = require('del');
const gulp        = require('gulp');
const yargs       = require('yargs');
const sass        = require('gulp-sass');
const log         = require('fancy-log');
const wait        = require('gulp-wait2');
const babel       = require('gulp-babel');
const c           = require('ansi-colors');
const rename      = require('gulp-rename');
const concat      = require('gulp-concat');
const babili      = require("gulp-babili");
const plumber     = require('gulp-plumber');
const browserSync = require('browser-sync');
const cleanCSS    = require('gulp-clean-css');
const sassGlob    = require('gulp-sass-glob');
const gcache      = require('gulp-file-cache');

let cache = new gcache();

let argv = yargs.argv;
let dir = argv.dir;
let file = argv.file;

const DIR = 'assets/';

const SRC = {
    //JS: DIR + 'js/src/' + dir + '/' + file + '.js',
    COMM: DIR + 'js/comm/src/**/*.js',
    JS: DIR + 'js/src/**/*.js',
    SCSS: DIR + 'css/src/style.scss',
};

const DIST = {
    //JS: DIR + 'js/dist/' + dir,
    COMM: DIR + 'js/comm',
    JS: DIR + 'js/dist',
    CSS: DIR + 'css/dist',
};

const WATCH = {
    COMM: DIR + 'js/comm/**/*.js',
    JS: DIR + 'js/src/**/*',
    CSS: DIR + 'css/src/**/*',
}

const INIT = {
    //JS: DIR + 'js/dist/' + dir + '/' + file + '.min.js',
    COMM: DIR + 'js/comm/common.min.js',
    JS: DIR + 'js/dist/**/*.min.js',
    CSS: DIR + 'css/dist/*.min.css',
};

function doesFileExist(filePath) {
    fs.stat(filePath, function (err, stat) {
        if (err == null) {
            return true;
        } else {
            return false;
        }
    });
}

/* ########## COMMON JS minifying ########## */

/* INIT */
function comm_init () {
    return del([INIT.COMM], {force : true});
}

/* MINIFY */
function comm_min () {
    return gulp.src(SRC.COMM)
        .pipe(cache.filter())
        .pipe(plumber())
        .pipe(babel({
            presets: ['env']
        }))
        .pipe(babili({
            mangle: {
                keepClassName: true
            }
        }))
        .pipe(wait(DIST.COMM))
        .pipe(concat('common.min.js'))
        .pipe(gulp.dest(DIST.COMM));
}

var comm = gulp.parallel(comm_init, comm_min);

/* ########## JS minifying ########## */

/* INIT */
function js_init() {
    //log('Gulp JS Initializing ..');
    return del([INIT.JS], {force: true});
}

/* MINIFY */
function js_min() {
    log('Gulp JS Processing is running..');

    return gulp.src(SRC.JS)
        .pipe(cache.filter())
        .pipe(plumber())
        .pipe(babel({
            presets: ['env']
        }))
        .pipe(babili({
            mangle: {
                keepClassName: true
            }
        }))
        .pipe(rename(function (path) {
            path.extname = ".min.js"
        }))
        .pipe(gulp.dest(DIST.JS));
}

var js = gulp.parallel(js_init, js_min);

/* ########## CSS minifying ########## */

/* INIT */
function css_init () {
//return del([INIT.CSS, INIT._CSS], {force : true});
    return del([INIT.CSS], {force: true});
}

/* SASS */
function css_sass() {
    return gulp.src(SRC.SCSS)
        .pipe(cache.filter())
        .pipe(plumber())
        .pipe(sassGlob())
        .pipe(sass().on('error', sass.logError))
        .pipe(cleanCSS({compatibility: 'ie8'}))
        .pipe(concat('style.min.css'))
        .pipe(gulp.dest(DIST.CSS));
}

var css = gulp.parallel(css_init, css_sass);

/* BUILD */
var build = gulp.parallel(comm, js, css);

// exports.default = build;
gulp.task('default', build);

function watch() {
    const watcher = {
        comm : gulp.watch(WATCH.COMM, comm),
        js : gulp.watch(WATCH.JS,  js),
        css : gulp.watch(WATCH.CSS, css)
    };

    var notify = function (event) {
        log('File', c.yellow(event), 'was', c.bold.cyan('built'));
    };

    for(var key in watcher) {
        watcher[key].on('change', notify);
    }
}

exports.watch = watch;
//gulp.task('watch', watch);

// function browser_sync () {
//     //files: ["assets/js/**/*.*", "assets/css/*.*"],
//     browserSync.init(null, {
//         proxy: "http://localhost",
//         files: ["application/**/*.*", "assets/js/**/*.*", "assets/css/*.*"],
//         port: 3000
//     });
// }
//
// gulp.task('browser-sync', browser_sync);
