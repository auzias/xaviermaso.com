var gulp = require('gulp');

var gls = require('gulp-live-server');
gulp.task('serve', function() {
    var server = gls.new('app.js', 8082, {env: {NODE_ENV: 'development'}});
    server.start();

    gulp.watch(
        [
            './views/*.jade',
            'routes/*.js',
            'public/javascripts/*.js',
            'public/stylesheets/*.css'
        ],
        server.start
    );
});
