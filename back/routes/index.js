'use strict'

var express = require('express')
var path = require('path')
var router = express.Router()

/* GET single page application */
router.get('/', function (req, res) {
  if (process.env.NODE_ENV === 'production') {
    res.sendFile('index.html', { root: path.join(__dirname, '../../dist/') })
  } else {
    // redirect to webpack-dev-server
    res.redirect('http://localhost:8080/')
  }
})

module.exports = router
