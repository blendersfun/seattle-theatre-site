
/**
 * Dependencies.
 */

var gulp = require('gulp');
var del = require('del');
var react = require('gulp-react');
var browserify = require('gulp-browserify');
var reactify = require('reactify');
var yaml = require('gulp-yaml');

/**
 * Build Paths.
 */

var paths = {

  // src
  appJs: ['src/app/**/*.js'],
  serverJs: ['src/server/**/*.js'],
  jsx: ['src/app/**/*.jsx'],
  queries: ['src/server/**/*-queries.yaml'],
  bundle: 'src/app/client.js',

  // dist
  distPrivateServer: 'dist/private/server',
  distPrivateApp: 'dist/private/app',
  distPublic: 'dist/public'

};

/**
 * Clean task.
 */

gulp.task('clean', function (cb) {
  del(['dist'], cb);
});

/**
 * Build task.
 */

gulp.task('build-queries', function() {
  return gulp.src(paths.queries)
    .pipe(yaml())
    .pipe(gulp.dest(paths.distPrivateServer));
});

gulp.task('copy-server-js', function() {
  return gulp.src(paths.serverJs)
    .pipe(gulp.dest(paths.distPrivateServer));
});

gulp.task('copy-app-js', function() {
  return gulp.src(paths.appJs)
    .pipe(gulp.dest(paths.distPrivateApp));
});

gulp.task('copy-js', ['copy-app-js','copy-server-js']);

gulp.task('transform-jsx', function() {
  return gulp.src(paths.jsx)
    .pipe(react())
    .pipe(gulp.dest(paths.distPrivateApp));
});

gulp.task('browserify', function() {
  return gulp.src(paths.bundle)
    .pipe(browserify({
        extensions: ['.jsx'],
        transform: reactify
    }))
    .pipe(gulp.dest(paths.distPublic));
});

gulp.task('build', ['build-queries', 'copy-js', 'transform-jsx', 'browserify']);

/**
 * Watch task.
 */

gulp.task('watch', function() {
  var allFiles = [paths.appJs, paths.serverJs, paths.jsx, paths.queries];
  gulp.watch(allFiles, ['build']);
});

/**
 * Default task.
 */

gulp.task('default', ['watch', 'build']);
