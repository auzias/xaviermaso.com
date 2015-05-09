var express = require('express');
var router = express.Router();


var librarybox = {
  'id': 1,
  'tileContent': 'librarybox',
  'title': 'LibraryBox',
  'dates': 'december 2014 - today',
  'tags': 'angularjs, gulp, associative entrepreneurship',
  'link': 'https://github.com/Labx/LibraryBox-app'
};

var frontendCheminot = {
  'id': 2,
  'tileContent': 'cheminot.cer-sncf-bx.org',
  'title': "Front-end for SNCF's employees",
  'dates': 'december 2013 - august 2014',
  'tags': 'project management, ruby-on-rails, front-end development (sass, coffeescript, slim), system administration, communication',
  'link': 'http://cheminot.cer-sncf-bx.org'
};

var carrotmob = {
  'id': 3,
  'tileContent': 'carrotmob',
  'title': 'CarrotMob France',
  'dates': 'june 2014 - september 2014',
  'tags': 'nodejs stack (sailsjs, grunt, bower), associative entrepreneurship',
  'link': 'http://www.carrotmob.fr/'
};

var wheredrop = {
  'id': 4,
  'tileContent': 'wheredrop',
  'title': 'Wheredrop',
  'dates': 'april - june 2013',
  'tags': 'angularjs , entrepreneurship',
  'link': 'http://wheredrop.eu01.aws.af.cm/#'
};

var bemydiary = {
  'id': 5,
  'tileContent': 'bemydiary @ bemyapp',
  'title': 'BeMyDiary',
  'dates': 'november 2012 - march 2013',
  'tags': 'project management , communication , entrepreneurship'
};

var swto = {
  'id': 6,
  'tileContent': 'la console @ swto',
  'title': 'Startup Weekend Toulouse',
  'dates': 'march 2013',
  'tags': 'project management, communication, marketing, entrepreneurship'
};

var cooking = {
  'id': 7,
  'tileContent': 'cooking @ imaginecup',
  'title': 'CooKing',
  'dates': 'december 2010 - may 2011',
  'tags':  'project management, game development'
};

var humanutty = {
  'id': 8,
  'tileContent': 'humanutty @ imaginecup',
  'title': 'HumaNutty',
  'dates':'december 2012 - may 2013',
  'tags': 'project management, game development, communication'
};



var projects = [wheredrop, bemydiary, cooking, humanutty, swto, carrotmob,
  librarybox, frontendCheminot
];

/* GET projects page. */
router.get('/', function(req, res) {
  res.render(
    'projects',
    { title: 'Xavier Maso | Projects' , section: 'Projects' , projects: projects }
  );
});

/* GET a single project. */
router.get('/:id', function(req, res) {
  projects.forEach(function(project) {
    if (project.id == req.params.id) {
      res.send(project);
    }
  });
});

module.exports = router;
