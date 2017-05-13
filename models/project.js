'use strict'

// Yes, the db is currently a json file...
var readFile = require('fs-readfile-promise')
var projects = readFile('models/db.json', 'utf8')

var onRejected = function (err) {
  console.log(err)
}

module.exports = (function () {
  var all = function () {
    return projects.then(function (data) {
      return JSON.parse(data).projects
    }, onRejected)
  }

  return {
    all: all
  }
})()
