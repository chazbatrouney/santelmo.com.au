$(function() {
  $('a.lightbox').lightBox(); // Select all links with lightbox class
  $('a.pjax').pjax('#bg', {fragment: '#bg', timeout: 2000});
});

$('#bg').live('pjax:start', function() {
  $('#main').hide('slide', {direction: 'right'})
});

$('#bg').live('pjax:end', function(event, xhr, options) {
  $('.link').removeClass('current')
    .filter(function() { return $(this).find('a').get(0).href == options.url; }).addClass('current');
  $('a.lightbox').lightBox(); // Select all links with lightbox class
  $('#main').show('slide', {direction: 'right'})
  
  if (options.url.match(/gallery/)) {
  $('body').addClass('gallery');
  } else {
  $('body').removeClass('gallery');
}
  
});
