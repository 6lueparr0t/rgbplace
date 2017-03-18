'use strict';
 
const del = require('del');
const gulp = require('gulp');
const yargs = require('yargs');
const gutil = require('gulp-util');
const rename = require('gulp-rename');
const uglify = require('gulp-uglify');
const concat = require('gulp-concat');
const gcache = require('gulp-file-cache');
const cleanCSS = require('gulp-clean-css');
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
    JS: DIR.SRC + 'js/' + dir + '/' + file + '.js',
    CSS: DIR.SRC + 'css/*.css',
};
 
const DEST = {
    JS: DIR.DEST + 'js/' + dir,
    CSS: DIR.DEST + 'css/',
};

const INIT = {
    JS: DIR.DEST + 'js/' + dir + '/' + file + '.min.js',
    CSS: DIR.DEST + 'css/*.min.css',
};

gulp.task('default', function () {
    gutil.log("command : gulp js[js-init || js-min] --dir=directory --file=filename");
    gutil.log("command : gulp css[css-init || css-min]");
});

gulp.task('watch', function() {
	gulp.watch(SRC.CSS, ['css']);
});

gulp.task('js', ['js-init', 'js-min'], function () {
    gutil.log('Gulp js Processing is running');
});

gulp.task('js-init', function () {
    return del.sync([INIT.JS], {force : true});
});

gulp.task('js-min', function () {
    return gulp.src(SRC.JS)
		.pipe(cache.filter())
		.pipe(uglify())
		.pipe(rename((path) =>  {
             path.extname = ".min.js"
         }))
        .pipe(gulp.dest(DEST.JS));
});

gulp.task('css', ['css-init', 'css-min'], function () {
    gutil.log('Gulp css Processing is running');
});

gulp.task('css-init', function () {
    return del.sync([INIT.CSS], {force : true});
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
