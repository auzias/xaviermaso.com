'use strict'

var express = require('express')
var path = require('path')
var logger = require('morgan')

var app = express()

var server = app.listen(8000, function () {
  console.log('Listening on port %d', server.address().port)
})

app.use(logger('dev'))
app.use(express.static(path.join(__dirname, '../dist')))

// app.set('view engine', 'html');

app.use('/', require('./routes/index'))
app.use('/projects', require('./routes/projects'))

// catch 404 and forwarding to error handler
app.use(function (req, res, next) {
  var err = new Error('Not Found')
  err.status = 404
  next(err)
})

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function (err, req, res, next) {
    res.status(500)
       .send({ message: err.message,
               error: err })
  })
}

// production error handler
// no stacktraces leaked to user
app.use(function (err, req, res, next) {
  res.status(500)
     .send( { message: err.message })
})

module.exports = app
