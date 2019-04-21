// pull in desired CSS/SASS files
require('./styles/main.scss')

// inject bundled Elm app into div#main
var Elm = require('../elm/Main')

var projectsUrl = (process.env.NODE_ENV === 'production') ? 'http://xaviermaso.com/api/projects' : 'http://localhost:8000/api/projects'

Elm.Main.embed(document.getElementById('main'), {
  projectsUrl: projectsUrl
})
