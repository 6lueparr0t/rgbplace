'use strict';
 
const del = require('del');
const gulp = require('gulp');
const yargs = require('yargs');
const sass = require('gulp-sass');
const gutil = require('gulp-util');
const rename = require('gulp-rename');
const uglify = require('gulp-uglify');
const concat = require('gulp-concat');
const plumber = require('gulp-plumber');
const gcache = require('gulp-file-cache');
const cleanCSS = require('gulp-clean-css');
const sassGlob = require('gulp-sass-glob');
const browserSync = require('browser-sync');

let cache = new gcache();

let argv = yargs.argv;
let dir  = argv.dir;
let file = argv.file;

const DIR = 'assets/';
 
const SRC = {
    //JS: DIR + 'js/src/' + dir + '/' + file + '.js',
    COMM: DIR + 'js/comm/**/*.js',
    JS: DIR + 'js/src/**/*.js',
    CSS: DIR + 'css/src/*.css',
    SCSS: DIR + 'css/src/style.scss',
};
 
const DIST = {
    //JS: DIR + 'js/dist/' + dir,
    COMM: DIR + 'js/comm',
    JS: DIR + 'js/dist',
    CSS: DIR + 'css/dist',
    SCSS: DIR + 'css/src',
};

const WATCH = {
    COMM: DIR + 'js/comm/**/*.js',
    JS: DIR + 'js/src/**/*',
	CSS: DIR + 'css/src/**/*'
}

const INIT = {
    //JS: DIR + 'js/dist/' + dir + '/' + file + '.min.js',
    COMM: DIR + 'js/comm/common.min.js',
    JS: DIR + 'js/dist/**/*.min.js',
    CSS: DIR + 'css/dist/*.min.css',
};

gulp.task('default', ['comm', 'js', 'css', 'watch'], function () {
    //gutil.log("command : gulp css[css-init || css-min]");
});

gulp.task('watch', function () {
    const watcher = {
		comm : gulp.watch(WATCH.COMM, ['comm']),
		js : gulp.watch(WATCH.JS,  ['js']),
		css : gulp.watch(WATCH.CSS, ['css'])
	};
 
    var notify = function (event) {
        gutil.log('File', gutil.colors.yellow(event.path), 'was', gutil.colors.magenta(event.type));
    };
 
    for(var key in watcher) {
        watcher[key].on('change', notify);
    }
});

/* TASK */
gulp.task('comm', ['comm-init', 'comm-min'], function () {
	gutil.log('Gulp COMM Processing is running');
});

gulp.task('js', ['js-init', 'js-min'], function () {
	gutil.log('Gulp JS Processing is running');
});

/* INIT */
gulp.task('comm-init', function () {
	return del.sync([INIT.COMM], {force : true});
});

gulp.task('js-init', function () {
	return del.sync([INIT.JS], {force : true});
});

/* MINIFY  */
gulp.task('comm-min', function () {
	return gulp.src(SRC.COMM)
		.pipe(cache.filter())
		.pipe(plumber())
		.pipe(uglify())
		.pipe(concat('common.min.js'))
		.pipe(gulp.dest(DIST.COMM));
});

gulp.task('js-min', function () {
	return gulp.src(SRC.JS)
		.pipe(cache.filter())
		.pipe(plumber())
		.pipe(uglify())
		.pipe(rename( function (path) {
			 path.extname = ".min.js"
		 }))
		.pipe(gulp.dest(DIST.JS));
});

/* CSS */

gulp.task('css', ['css-init', 'css-sass', 'css-min'], function () {
    gutil.log('Gulp css Processing is running');
});

gulp.task('css-init', function () {
    return del.sync([INIT.CSS], {force : true});
});

gulp.task('css-sass', function () {
	return gulp.src(SRC.SCSS)
		.pipe(cache.filter())
		.pipe(plumber())
		.pipe(sassGlob())
		.pipe(sass().on('error', sass.logError))
		.pipe(rename({
			prefix: "_"
		 }))
		.pipe(gulp.dest(DIST.SCSS));
});

gulp.task('css-min', function () {
	return gulp.src(SRC.CSS)
		.pipe(cache.filter())
		.pipe(plumber())
		.pipe(cleanCSS({compatibility: 'ie8'}))
		.pipe(concat('style.min.css'))
		.pipe(gulp.dest(DIST.CSS));
});

//files: ["assets/js/**/*.*", "assets/css/*.*"],
gulp.task('browser-sync', function () {
	browserSync.init(null, {
		proxy: "http://localhost",
		files: ["application/**/*.*", "assets/js/**/*.*", "assets/css/*.*"],
			port: 3000
		})
});
