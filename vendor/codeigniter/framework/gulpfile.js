'use strict';
 
const del = require('del');
const gulp = require('gulp');
const yargs = require('yargs');
const sass = require('gulp-sass');
const gutil = require('gulp-util');
const rename = require('gulp-rename');
const uglify = require('gulp-uglify');
const concat = require('gulp-concat');
const gcache = require('gulp-file-cache');
const cleanCSS = require('gulp-clean-css');
const sassGlob = require('gulp-sass-glob');
const browserSync = require('browser-sync');

let cache = new gcache();

let argv = yargs.argv;
let dir  = argv.dir;
let file = argv.file;

const DIR = {
	SRC : './assets/',
	DEST: './assets/',
};
 
const SRC = {
    //JS: DIR.SRC + 'js/src/' + dir + '/' + file + '.js',
    COMMON: DIR.SRC + 'js/src/common/**/*.js',
    ADM: DIR.SRC + 'js/src/admin/*.js',
    EX: DIR.SRC + 'js/src/admin/example/*.js',
    PLAY: DIR.SRC + 'js/src/play/*.js',
    CSS: DIR.SRC + 'css/src/*.css',
    SCSS: DIR.SRC + 'css/src/style.scss',
};
 
const DEST = {
    //JS: DIR.DEST + 'js/dest/' + dir,
    COMMON: DIR.SRC + 'js/dest',
    ADM: DIR.SRC + 'js/dest/admin',
    EX: DIR.SRC + 'js/dest/admin/example',
    PLAY: DIR.SRC + 'js/dest/play',
    CSS: DIR.DEST + 'css/dest',
    SCSS: DIR.SRC + 'css/src',
};

const INIT = {
    //JS: DIR.DEST + 'js/dest/' + dir + '/' + file + '.min.js',
    COMMON: DIR.SRC + 'js/dest/*.*',
    ADM: DIR.SRC + 'js/dest/admin/*.*',
    EX: DIR.SRC + 'js/dest/admin/example/*.*',
    PLAY: DIR.SRC + 'js/dest/play/*.*',
    CSS: DIR.DEST + 'css/dest/*.min.css',
};

gulp.task('default', ['common', 'adm', 'ex', 'play', 'css'], function () {
    //gutil.log("command : gulp css[css-init || css-min]");
});

gulp.task('watch', function() {
	gulp.watch(SRC.COMMON, ['common']);
	gulp.watch(SRC.ADM, ['adm']);
	gulp.watch(SRC.EX,  ['ex']);
	gulp.watch(SRC.PLAY,['play']);
	gulp.watch(SRC.CSS, ['css']);
});

/* TASK */
gulp.task('common', ['common-init', 'common-min'], function () {
	gutil.log('Gulp admin Processing is running');
});

gulp.task('adm', ['adm-init', 'adm-min'], function () {
	gutil.log('Gulp admin Processing is running');
});

gulp.task('ex', ['ex-init', 'ex-min'], function () {
	gutil.log('Gulp example Processing is running');
});

gulp.task('play', ['play-init', 'play-min'], function () {
	gutil.log('Gulp play Processing is running');
});

/* INIT */
gulp.task('common-init', function () {
	return del.sync([INIT.COMMON], {force : true});
});

gulp.task('adm-init', function () {
	return del.sync([INIT.ADM], {force : true});
});

gulp.task('ex-init', function () {
	return del.sync([INIT.EX], {force : true});
});

gulp.task('play-init', function () {
	return del.sync([INIT.PLAY], {force : true});
});

/* MINIFY  */
gulp.task('common-min', function () {
	return gulp.src(SRC.COMMON)
		.pipe(cache.filter())
		.pipe(uglify())
		.pipe(concat('common.min.js'))
		.pipe(gulp.dest(DEST.COMMON));
});

gulp.task('adm-min', function () {
	return gulp.src(SRC.ADM)
		.pipe(cache.filter())
		.pipe(uglify())
		.pipe(rename((path) =>  {
			 path.extname = ".min.js"
		 }))
		.pipe(gulp.dest(DEST.ADM));
});

gulp.task('ex-min', function () {
	return gulp.src(SRC.EX)
		.pipe(cache.filter())
		.pipe(uglify())
		.pipe(rename((path) =>  {
			 path.extname = ".min.js"
		 }))
		.pipe(gulp.dest(DEST.EX));
});

gulp.task('play-min', function () {
	return gulp.src(SRC.PLAY)
		.pipe(cache.filter())
		.pipe(uglify())
		.pipe(rename(function (path) {
			 path.extname = ".min.js"
		 }))
		.pipe(gulp.dest(DEST.PLAY));
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
		.pipe(sassGlob())
		.pipe(sass().on('error', sass.logError))
		.pipe(rename({
			prefix: "_"
		 }))
		.pipe(gulp.dest(DEST.SCSS));
});

gulp.task('css-min', function () {
	return gulp.src(SRC.CSS)
		.pipe(cache.filter())
		.pipe(cleanCSS({compatibility: 'ie8'}))
		.pipe(concat('style.min.css'))
		.pipe(gulp.dest(DEST.CSS));
});

//files: ["assets/js/**/*.*", "assets/css/*.*"],
gulp.task('browser-sync', function () {
	browserSync.init(null, {
		proxy: "http://localhost",
		files: ["application/**/*.*", "assets/js/**/*.*", "assets/css/*.*"],
			port: 3000
		})
});
