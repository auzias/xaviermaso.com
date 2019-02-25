'use strict'

require('./styles/main.scss')

var Elm = require('../elm/Main').Elm
var projectsUrl = (process.env.NODE_ENV === 'production') ? 'http://xaviermaso.com/api/projects' : 'http://localhost:8000/api/projects'

Elm.Main.init({ flags: {
  projectsUrl: projectsUrl
} })
