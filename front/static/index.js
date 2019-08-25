'use strict'

require('./styles/main.scss')

var devAPI = 'http://localhost:8000/api'
var prodAPI = 'http://xaviermaso.com/api'
var API = (process.env.NODE_ENV === 'production') ? prodAPI : devAPI

var projectsUrl = API + '/projects'

var Elm = require('../elm/Main').Elm

Elm.Main.init({
  flags: {
    projectsUrl: projectsUrl
  }
})
