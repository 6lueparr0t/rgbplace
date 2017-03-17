'use strict';
 
import gulp from 'gulp';
import gutil from 'gulp-util';
import rename from 'gulp-rename';
import uglify from 'gulp-uglify';
import concat from 'gulp-concat';
import cleanCSS from 'gulp-clean-css';
import yargs from 'yargs';
import del from 'del';

const argv = yargs.argv;
const dir  = argv.dir;
const file = argv.file;

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

gulp.task('default', () => {
    gutil.log("command : gulp js[js-init || js-min] --dir=directory --file=filename");
    gutil.log("command : gulp css[css-init || css-min]");
});

gulp.task('js', ['js-init', 'js-min'], () => {
    gutil.log('Gulp js Processing is running');
});

gulp.task('js-init', () => {
    return del.sync([INIT.JS], {force : true});
});

gulp.task('js-min', () => {
    return gulp.src(SRC.JS)
		.pipe(uglify())
		.pipe(rename((path) =>  {
             path.extname = ".min.js"
         }))
        .pipe(gulp.dest(DEST.JS));
});

gulp.task('css', ['css-init', 'css-min'], () => {
    gutil.log('Gulp css Processing is running');
});

gulp.task('css-init', () => {
    return del.sync([INIT.CSS], {force : true});
});

gulp.task('css-min', () => {
	return gulp.src(SRC.CSS)
		.pipe(cleanCSS({compatibility: 'ie8'}))
		.pipe(concat('style.min.css'))
		.pipe(gulp.dest(DEST.CSS));
});
