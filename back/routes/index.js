'use strict'

var express = require('express')
var router = express.Router()

/* GET home page. */
router.get('/', function (req, res) {
  if (process.env.NODE_ENV === 'production') {
    res.sendFile('index.html')
  } else {
    res.redirect('http://localhost:8080/')
  }
})

module.exports = router
