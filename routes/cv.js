var express = require('express')
var router = express.Router()

/* GET cv page. */
router.get('/', function (req, res) {
  res.render('cv', { title: 'Xavier Maso | CV', section: 'CV' })
})

module.exports = router
