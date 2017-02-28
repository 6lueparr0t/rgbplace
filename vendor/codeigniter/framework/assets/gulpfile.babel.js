'use strict';
 
import gulp from 'gulp';
import gutil from 'gulp-util';
import rename from 'gulp-rename';
import babel from 'gulp-babel';
import uglify from 'gulp-uglify';
import concat from 'gulp-concat';
import cleanCSS from 'gulp-clean-css';
import del from 'del';

const DIR = {
    SRC: 'src',
    DEST: 'dist'
};
 
const SRC = {
    JS: DIR.SRC + '/js/*.js',
    JSX: DIR.SRC + '/jsx/*.jsx',
    CSS: DIR.SRC + '/css/*.css',
    HTML: DIR.SRC + '/*.html',
    IMAGES: DIR.SRC + '/images/*'
};
 
const DEST = {
    JS: DIR.DEST + '/js',
    JSX: DIR.DEST + '/jsx',
    CSS: DIR.DEST + '/css',
    HTML: DIR.DEST + '/',
    IMAGES: DIR.DEST + '/images'
};

gulp.task('default', ['clean', 'js', 'css', 'html', 'images'], () => {
    gutil.log('Gulp is running');
});

gulp.task('js', () => {
    return gulp.src(SRC.JS)
           .pipe(uglify())
           .pipe(gulp.dest(DEST.JS));
});

gulp.task('css', () => {
    return gulp.src(SRC.CSS)
           .pipe(cleanCSS({compatibility: 'ie8'}))
           .pipe(gulp.dest(DEST.CSS));
});

gulp.task('html', () => {
    return gulp.src(SRC.HTML)
          .pipe(htmlmin({collapseWhitespace: true}))
          .pipe(gulp.dest(DEST.HTML))
});

gulp.task('images', () => {
    return gulp.src(SRC.IMAGES)
           .pipe(imagemin())
           .pipe(gulp.dest(DEST.IMAGES));
});

gulp.task('babel', function(){
    return gulp.src('src/jsx/*.jsx')
        .pipe(babel({
            plugins: ['transform-react-jsx']
        }))
		.pipe(uglify())
		.pipe(rename(function (path) {
             path.extname = ".min.js"
         }))
        .pipe(gulp.dest("src/jsx/"));
});

gulp.task('merge', function(){
    return gulp.src(['src/libs/react.min.js', 'src/libs/react-dom.min.js', 'src/jsx/*.min.js'])
        .pipe(concat('scripts.js'))
		.pipe(uglify())
        .pipe(gulp.dest("src/jsx/"));
});

gulp.task('clean', () => {
    return del.sync([DIR.DEST]);
});
