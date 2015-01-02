var browserify = require('gulp-browserify');
var clean = require('gulp-clean');
var gulp = require('gulp');
var jsx = require('gulp-jsx');
var reactify = require('reactify');
var yaml = require('gulp-yaml');

var paths = {
  scripts: ['client/**/*.js', 'client/**/*.jsx'],
  queries: ['client/**/*.yaml']
};

// Remove built files.
gulp.task('clean', function(callback) {
  return gulp.src('public/**/*')
    .pipe(clean());
});

// Top-level build task.
gulp.task('build', ['build-js', 'build-queries']);

// Convert the yaml to json.
gulp.task('build-queries', function() {
  return gulp.src(paths.queries)
    .pipe(yaml())
    .pipe(gulp.dest('public'));
});

// Build the js files.
gulp.task('build-js', function() {
  return gulp.src(paths.scripts)
    .pipe(jsx())
    .pipe(gulp.dest('public'));
});

gulp.task('browserify', function() {
  return gulp.src('client/client.js')
    .pipe(browserify({
        transform: reactify
    }))
    .pipe(gulp.dest('public'));
});

// Rerun the task when a file changes.
gulp.task('watch', function() {
  var allFiles = [paths.scripts, paths.queries];
  gulp.watch(allFiles, ['build']);
});

// The default task (called when you run `gulp` from cli).
gulp.task('default', ['watch', 'build']);
