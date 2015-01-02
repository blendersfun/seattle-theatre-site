var gulp = require('gulp');
var clean = require('gulp-clean');

var paths = {
  scripts: ['client/**/*.js']
};

gulp.task('clean', function(callback) {
  return gulp.src('public/**/*')
    .pipe(clean());
});

gulp.task('build', ['clean'], function() {
  return gulp.src(paths.scripts)
    .pipe(gulp.dest('public'));
});

// Rerun the task when a file changes
gulp.task('watch', function() {
  gulp.watch(paths.scripts, ['build']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['watch', 'build']);
