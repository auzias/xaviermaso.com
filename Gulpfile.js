var gulp = require('gulp');
var gls = require('gulp-live-server');
var gulpNSP = require('gulp-nsp');
var shrinkwrap = require('gulp-shrinkwrap');

gulp.task('nsp', function (cb) {
  gulpNSP('./npm-shrinkwrap.json', cb);
});

gulp.task('shrinkwrap', function () {
  return gulp.src('package.json')
    .pipe(shrinkwrap())
    .pipe(gulp.dest('./'));
});

gulp.task('serve', function() {
  var server = gls.new('app.js', 8082, {env: {NODE_ENV: 'development'}});
  server.start();

  gulp.watch([
      'views/*.jade',
      'routes/*.js',
      'models/*.js',
      'public/javascripts/*.js',
      'public/stylesheets/*.css'
    ],
    function() {
      server.notify.apply(server, arguments);
    }
  );
});

gulp.task('watch', function() {
  gulp.watch('package.json', ['shrinkwrap']);
  gulp.watch('npm-shrinkwrap.json', ['nsp']);
});

gulp.task('default', ['serve', 'watch']);
