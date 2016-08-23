'use strict'

var $ = require('jquery')

window.showProjetDesc = function (projectId) {
  $.get(
    '/projects/' + projectId,
    function (project) {
      // print top tile
      $('#project-description').show()
      $('.top-row').removeClass('top-row').addClass('bottom-row')
      $('#project-description').addClass('top-row')

      // add content
      $('#project-title').html(project.title)
      $('#project-dates').html(project.dates)
      $('#project-tags').html(project.tags)

      // link management
      if (typeof project.link === 'undefined') {
        $('#project-link').hide()
      } else {
        $('#project-link').show()
        $('#project-link').html('<a href=\'' + project.link + '\' target=\'blank_\'>' + project.link + '</a>')
      }
    }
  )
}

window.closeProjectDesc = function (element) {
  $('#project-description').hide()
  $('#project-description').removeClass('top-row')
  $($('.bottom-row')[0]).removeClass('bottom-row').addClass('top-row')
}
