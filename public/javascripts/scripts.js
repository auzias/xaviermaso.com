function showProjetDesc(projectId) {
  $.get(
    '/projects/' + projectId,
    function(project) {
      // print top tile
      $('#projectDescription').show();
      $('.topRow').removeClass('topRow').addClass('bottomRow');
      $('#projectDescription').addClass('topRow');

      // add content
      $('#projectTitle').html(project.title);
      $('#projectDates').html(project.dates);
      $('#projectTags').html(project.tags);

      // link management
      if (typeof project.link === "undefined") {
        $('#projectLink').hide();
      }
      else {
        $('#projectLink').show();
        $('#projectLink').html("<a href='" + project.link + "' target='blank_'>" + project.link + "</a>");
      }
    }
  );
}


function closeProjectDesc(element) {
  $('#projectDescription').hide();
  $('#projectDescription').removeClass('topRow');
  $($('.bottomRow')[0]).removeClass('bottomRow').addClass('topRow');
}
