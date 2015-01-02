var gulp = require('gulp');
var del = require('del');

var paths = {
  scripts: ['client/**/*.js']
};

gulp.task('clean', function(callback) {
  del(['build'], callback);
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
