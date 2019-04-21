'use strict'

var express = require('express')
var path = require('path')
var router = express.Router()

/* GET home page. */
router.get('/', function (req, res) {
  if (process.env.NODE_ENV === 'production') {
    res.sendFile('index.html', { root: path.join(__dirname, '../../dist/') })
  } else {
    res.redirect('http://localhost:8080/')
  }
})

module.exports = router
