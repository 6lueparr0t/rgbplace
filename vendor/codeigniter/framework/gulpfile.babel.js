'use strict';
 
import gulp from 'gulp';
import gutil from 'gulp-util';
import gulpif from 'gulp-if';
import react from 'gulp-react';
import rename from 'gulp-rename';
import babel from 'gulp-babel';
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
    JSX: DIR.SRC + 'js/' + dir + '/' + file + '.jsx',
    JSXALL: DIR.SRC + 'js/common/src/_*.jsx',
    JS: DIR.SRC + 'js/' + dir + '/' + file + '.js',
    CSS: DIR.SRC + 'css/*.css',
};
 
const DEST = {
    JS: DIR.DEST + 'js/' + dir,
    CSS: DIR.DEST + 'css/',
};

const INIT = {
    JSMIN: DIR.DEST + 'js/' + dir + '/' + file + '.js',
    CSS: DIR.DEST + 'css/*.min.css',
};

gulp.task('default', () => {
	gutil.log("command : gulp [[ react('react-init', 'react-jsx') react-all --dir=directory --file=filename ] | react-common]");
    gutil.log("command : gulp css('css-init', 'css-min')");
});

gulp.task('react', ['react-init', 'react-jsx'], () => {
    gutil.log('Gulp React Processing is running');
});

gulp.task('react-init', () => {
    return del.sync([INIT.JSMIN], {force : true});
});

gulp.task('react-jsx', () => {
    return gulp.src(SRC.JSX)
        .pipe(babel({
            plugins: ['transform-react-jsx']
        }))
		.pipe(uglify())
		.pipe(rename((path) =>  {
             path.extname = ".js"
         }))
        .pipe(gulp.dest(DEST.JS));
});

gulp.task('react-all', () => {
    return gulp.src(['node_modules/react/dist/react.min.js', 'node_modules/react-dom/dist/react-dom.min.js', SRC.JS])
        .pipe(concat(file+'.js'))
		.pipe(rename(function (path) {
			path.dirname = 'js/common',
			path.basename= file
         }))
		.pipe(uglify())
        .pipe(gulp.dest(DIR.DEST));
});

gulp.task('react-common', () => {
    return gulp.src(['node_modules/react/dist/react.min.js', 'node_modules/react-dom/dist/react-dom.min.js'])
        .pipe(concat('common.js'))
		.pipe(rename(function (path) {
			path.dirname = 'js/common',
			path.basename= 'common'
         }))
		.pipe(uglify())
        .pipe(gulp.dest(DIR.DEST));
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
