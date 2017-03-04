'use strict';
 
import gulp from 'gulp';
import react from 'gulp-react';
import gutil from 'gulp-util';
import rename from 'gulp-rename';
import babel from 'gulp-babel';
import uglify from 'gulp-uglify';
import concat from 'gulp-concat';
import cleanCSS from 'gulp-clean-css';
import gulpif from 'gulp-if';
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
    JS: DIR.SRC + 'js/' + dir + '/' + file + '.js',
    CSS: DIR.SRC + 'css/*.css',
};
 
const DEST = {
    JS: DIR.DEST + 'js/' + dir,
    CSS: DIR.DEST + 'css/',
};

const INIT = {
    JSMIN: DIR.DEST + 'js/' + dir + '/' + file + '.min.js',
    CSS: DIR.DEST + 'css/*.min.css',
};

gulp.task('js', ['js-init', 'js-babel'], () => {
    gutil.log('Gulp is running');
});

gulp.task('js-init', function() {
    return del.sync([INIT.JSMIN], {force : true});
});

gulp.task('js-babel', function(){
    return gulp.src(SRC.JSX)
        .pipe(babel({
            plugins: ['transform-react-jsx']
        }))
		.pipe(uglify())
		.pipe(rename(function (path) {
             path.extname = ".min.js"
         }))
        .pipe(gulp.dest(DEST.JS));
});

gulp.task('react-merge', function(){
    return gulp.src(['node_modules/react/dist/react.min.js', 'node_modules/react-dom/dist/react-dom.min.js'])
        .pipe(concat(file + '.min.js'))
		.pipe(rename(function (path) {
			path.dirname = 'js/common',
			path.basename= 'library'
         }))
		.pipe(uglify())
        .pipe(gulp.dest('./assets'));
});

gulp.task('css', ['css-init', 'css-merge'], () => {
    gutil.log('css init and merge..');
});

gulp.task('css-init', () => {
    return del.sync([INIT.CSS], {force : true});
});

gulp.task('css-merge', () => {
	return gulp.src(SRC.CSS)
		.pipe(cleanCSS({compatibility: 'ie8'}))
		.pipe(concat('style.min.css'))
		.pipe(gulp.dest(DEST.CSS));
});
