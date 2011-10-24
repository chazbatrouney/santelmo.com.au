$(function() {
  $('a.lightbox').lightBox(); // Select all links with lightbox class
  $('a.pjax').pjax('#bg', {fragment: '#bg'});
});



$('#bg').live('pjax:start', function() {
  $('#main').hide('slide', {direction: 'right'})
});

$('#bg').live('pjax:end', function(event, xhr, options) {
  $('.link').removeClass('current')
    .filter(function() { return $(this).find('a').get(0).href == options.url; }).addClass('current');

  $('#main').show('slide', {direction: 'right'})
});
