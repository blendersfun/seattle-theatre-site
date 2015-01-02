var browserify = require('gulp-browserify');
var clean = require('gulp-clean');
var gulp = require('gulp');
var jsx = require('gulp-jsx');
var reactify = require('reactify');
var run = require('gulp-run');
var runSequence = require('run-sequence');
var shell = require('gulp-shell');
var yaml = require('gulp-yaml');

var paths = {
  js: ['client/**/*.js'],
  jsx: ['client/**/*.jsx'],
  queries: ['client/**/*.yaml']
};

// Remove built files.
gulp.task('clean', function(callback) {
  return gulp.src('public/**/*')
    .pipe(clean());
});

// Top-level build task.
gulp.task('build', function(callback) {
    runSequence(['copy-js', 'build-jsx', 'build-queries'], 'browserify', callback);
});

// Convert the yaml to json.
gulp.task('build-queries', function() {
  return gulp.src(paths.queries)
    .pipe(yaml())
    .pipe(gulp.dest('public'));
});

// Copy the js files.
gulp.task('copy-js', function() {
  return gulp.src(paths.js)
    .pipe(gulp.dest('public'));
});

// Build the jsx files.
gulp.task('build-jsx', shell.task([
    'jsx -x jsx client/ public/'
]));

gulp.task('browserify', function() {
  return gulp.src('client/client.js')
    .pipe(browserify({
        transform: reactify
    }))
    .pipe(gulp.dest('public'));
});

// Rerun the task when a file changes.
gulp.task('watch', function() {
  var allFiles = [paths.js, paths.jsx, paths.queries];
  gulp.watch(allFiles, ['build']);
});

// The default task (called when you run `gulp` from cli).
gulp.task('default', ['watch', 'build']);
