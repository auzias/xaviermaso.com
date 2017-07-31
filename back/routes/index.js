'use strict'

var express = require('express')
var router = express.Router()
// var projects = require('../models/projects.js')

/* GET home page. */
router.get('/', function (req, res) {
  res.sendFile('index.html')
})

module.exports = router
