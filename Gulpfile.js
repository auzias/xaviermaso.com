'use strict'

var gulp = require('gulp')
var gulpNSP = require('gulp-nsp')
var shrinkwrap = require('gulp-shrinkwrap')

gulp.task('nsp', function (cb) {
  gulpNSP('./npm-shrinkwrap.json', cb)
})

gulp.task('shrinkwrap', function () {
  return gulp.src('package.json')
    .pipe(shrinkwrap())
    .pipe(gulp.dest('./'))
})

gulp.task('watch', function () {
  gulp.watch('package.json', ['shrinkwrap'])
  gulp.watch('npm-shrinkwrap.json', ['nsp'])
})

gulp.task('default', ['watch'])
